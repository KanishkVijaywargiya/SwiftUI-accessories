//
//  PresentingAlertActionSheetModals.swift
//  Swift-Accesories
//
//  Created by KANISHK VIJAYWARGIYA on 16/12/21.
//

import SwiftUI

struct PresentingAlertActionSheetModals: View {
    @State var showModalView = false
    @State var showActionSheet = false
    @State var showAlert = false
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Action Sheet's Title"), message: Text("This is a message"), buttons: [
            .default(Text("This is a default button"), action: {
                print("Default button tapped")
            }),
            .destructive(Text("This is a destructive button"), action: {
                print("Destructive Button pressed")
            }),
            .cancel()
        ])
    }
    
    var alert: Alert {
        Alert(title: Text("Alert Title"), message: Text("This is an alert"), primaryButton: .default(Text("Okay")), secondaryButton: .cancel())
    }
    
    var body: some View {
        VStack {
            Button(action: {self.showModalView.toggle()}) {
                Text("SHow Modal")
            }
            
            Button(action: {self.showActionSheet.toggle()}) {
                Text("Show Action Sheet")
            }
            
            Button(action: {self.showAlert.toggle()}) {
                Text("Show Alert")
            }
        }
        .sheet(isPresented: $showModalView) { ModalView() }
        .actionSheet(isPresented: $showActionSheet) { actionSheet }
        .alert(isPresented: $showAlert) { self.alert }
    }
}

struct ModalView: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Modal View")
        }
    }
}

struct PresentingAlertActionSheetModals_Previews: PreviewProvider {
    static var previews: some View {
        PresentingAlertActionSheetModals()
            .preferredColorScheme(.dark)
    }
}
