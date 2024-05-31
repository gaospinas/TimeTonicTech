//
//  MainTabView.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var tabSelection = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $tabSelection) {
                LandingView()
                    .tabItem {
                        Label("Landing", systemImage: "house")
                    }
                    .tag(0)
                
                PreferencesView()
                    .tabItem {
                        Label("Preferences", systemImage: "star")
                    
                    }
                    .tag(1)
            }
        }
    }
}



struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


 
