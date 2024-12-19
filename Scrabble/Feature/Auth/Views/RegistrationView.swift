//
//  RegistrationView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel: RegistrationViewModel
    
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
                
            registerButton
        }
    }
    
    var logo: some View {
        Text("Scrabble")
            .foregroundStyle(.blue)
            .font(.title)
    }
    
    var fields: some View {
        Group {
            TextField("username", text: $viewModel.username)
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
    
    var registerButton: some View {
        Button("Register") {
            viewModel.register()
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
}

#Preview {
    RegistrationView(viewModel: .init(isAuth: .constant(false)))
}
