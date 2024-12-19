//
//  ContentView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    
    @State
    var isAuth = false
    
    var body: some View {
        if isAuth {
            HomeView(homeVC: .init(isAuth: $isAuth))
        } else {
            NavigationView {
                LoginView(viewModel: .init(isAuth: $isAuth))
                    .onAppear {
                        isAuth = defaults.string(forKey: "JWTToken") != nil
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
