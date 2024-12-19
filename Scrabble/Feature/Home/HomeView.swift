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
        Button {
            defaults.removeObject(forKey: "JWTToken")
            homeVC.isAuth = false
        } label: {
            Text("logout")
        }

    }
}

#Preview {
    HomeView(homeVC: .init(isAuth: .constant(true)))
}
