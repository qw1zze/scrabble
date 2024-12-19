//
//  RegistrationViewModel.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

import Foundation
import SwiftUI

@MainActor
class RegistrationViewModel: ObservableObject {
    var username = ""
    var email = ""
    var password = ""
    
    
    @Published
    var showAlert = false
    @Binding var isAuth: Bool
    
    init(isAuth: Binding<Bool>) {
        _isAuth = isAuth
    }
    
    func register() {
        if username == "" || email == "" || password == "" {
            showAlert = true
            return
        }
        
        Task {
            let result = await Webservice().register(body: .init(username: username, email: email, password: password))
            switch result {
            case .success(let response):
                let defaults = UserDefaults.standard
                defaults.setValue(response.value, forKey: "JWTToken")
                isAuth = true
            case .failure(let error):
                self.showAlert = true
            }
        }
    }
}
