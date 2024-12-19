//
//  SettingsViewModel.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import SwiftUI

final class SettingsViewModel {
    
    @Binding var isAuth: Bool
    
    init(isAuth: Binding<Bool>) {
        _isAuth = isAuth
    }
    
    func logout() {
        isAuth = false
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "JWTToken")
    }
    
    func delete() {
        Task {
            guard let token = UserDefaults.standard.string(forKey: "JWTToken") else {
                return
            }
            
            let result = await Webservice().deleteAccount(token: token)
            switch result {
            case .success(let response):
                print()
            case .failure(let error):
                print()
            }
        }
    }
}
