//
//  HomeView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import SwiftUI

struct HomeView: View {
    let defaults = UserDefaults.standard
    
    @ObservedObject
    var homeVC: HomeViewModel
    
    var body: some View {
        TabView {
            VStack {}
                .tabItem {
                    Label("Rooms", systemImage: "list.bullet")
                }
            
            SettingsView(settingsVC: .init(isAuth: homeVC.$isAuth))
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }

    }
}

#Preview {
    HomeView(homeVC: .init(isAuth: .constant(true)))
}
