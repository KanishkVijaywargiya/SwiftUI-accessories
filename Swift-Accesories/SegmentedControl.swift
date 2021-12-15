//
//  SegmentedControl.swift
//  Swift-Accesories
//
//  Created by KANISHK VIJAYWARGIYA on 15/12/21.
//

import SwiftUI

struct SegmentedControl: View {
    @State private var selectedSide: SideOfTeam = .genius
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .green
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a side", selection: $selectedSide) {
                    ForEach(SideOfTeam.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChooseHero(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a side")
        }
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl().preferredColorScheme(.dark)
    }
}

enum SideOfTeam: String, CaseIterable {
    case genius = "Genius"
    case leader = "Leader"
    case kid = "Kid"
}

struct ChooseHero: View {
    var selectedSide: SideOfTeam
    
    var body: some View {
        switch selectedSide {
        case .genius:
            HeroImageView(heroname: "ironman")
        case .leader:
            HeroImageView(heroname: "captain")
        case .kid:
            HeroImageView(heroname: "spiderman")
        }
    }
}

struct HeroImageView: View {
    var heroname: String
    
    var body: some View {
        Image(heroname)
            .resizable()
            .frame(width: 250, height: 400)
            .shadow(color: .white, radius: 100)
    }
}
