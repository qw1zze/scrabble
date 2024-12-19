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
            RegistrationView(viewModel: .init(isAuth: $isAuth))
        }
        
        EmptyView()
            .onAppear {
                isAuth = defaults.string(forKey: "JWTToken") != nil
            }
    }
}

#Preview {
    ContentView()
}
