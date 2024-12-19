//
//  RegistrationView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: AuthViewModel
    
    var body: some View {
        main
            .alert("Invalidate data", isPresented: $viewModel.showAlert) {
                Button("Ok", role: .cancel) { }
            }
    }
    
    var main: some View {
        VStack {
            logo
            
            Spacer()
                .frame(height: 80)
            
            fields
                
            loginButton
            
            goToRegsiter
        }
    }
    
    var logo: some View {
        Text("Scrabble")
            .foregroundStyle(.blue)
            .font(.title)
    }
    
    var fields: some View {
        Group {
            TextField("email", text: $viewModel.email)
            SecureField("password", text: $viewModel.password)
            
        }
        .padding(.all, 10)
        .overlay {
            RoundedRectangle(cornerRadius: 14)
                .stroke(.blue, lineWidth: 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .font(.title3)
    }
    
    var loginButton: some View {
        Button("Login") {
            viewModel.login()
        }
        .frame(maxWidth: .infinity)
        .tint(.white)
        .padding(.all, 10)
        .background {
            RoundedRectangle(cornerRadius: 14)
                .fill(.blue)
        }
        .padding(.horizontal)
    }
    
    var goToRegsiter: some View {
        NavigationLink {
            RegistrationView(viewModel: viewModel)
        } label: {
            Text("Register")
        }
        .padding(.top, 30)
    }
}

#Preview {
    LoginView(viewModel: .init(isAuth: .constant(false)))
}
