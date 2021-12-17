//
//  HalfSheetModalAndBottomSheetDrawer.swift
//  Swift-Accesories
//
//  Created by KANISHK VIJAYWARGIYA on 17/12/21.
//

import SwiftUI

struct HalfSheetModal: View {
    var body: some View {
        Home()
    }
}

struct HalfSheetModalAndBottomSheetDrawer_Previews: PreviewProvider {
    static var previews: some View {
        HalfSheetModal()
    }
}

struct Home: View {
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            Button(action: {self.showSheet.toggle()}) {
                Text("Present Sheet")
            }
            .navigationTitle("Half Modal")
            .halfSheet(showSheet: $showSheet) {
                // half sheet view...
                ZStack {
                    Color.blue.ignoresSafeArea()
                    
                    Text("Hello I'm a half sheet Folks!")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

// custom half sheet modifier...
extension View {
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView ) -> some View {
        // we are using overlay or background bcz it will auto. use the SwiftUI frame size.
        return self
            .background(
                HalfSheetHelper(showSheet: showSheet, sheetView: sheetView())
            )
    }
}

// UIkit integration
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    @Binding var showSheet: Bool
    var sheetView: SheetView
    let controller = UIViewController()
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            let sheetController = CustomHostingController(rootView: sheetView)
            //            let sheetController = UIHostingController(rootView: sheetView)
            
            uiViewController.present(sheetController, animated: true) {
                DispatchQueue.main.async {
                    self.showSheet.toggle()
                }
            }
        }
    }
}

// Custom UIHostingController for HalfSheet...
class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        // setting presentation controller properties...
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            
            // to show grab portion...
            presentationController.prefersGrabberVisible = true
            presentationController.preferredCornerRadius = 20
        }
    }
}
