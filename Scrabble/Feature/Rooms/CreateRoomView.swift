//
//  CreateRoomView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 20/12/24.
//

import SwiftUI

struct CreateRoomView: View {
    @ObservedObject
    var viewModel: RoomsViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Toggle("Private", isOn: $viewModel.newRoom.isPrivate)
            HStack {
                Text("Time per turn")
                
                Spacer()
                
                TextField("Time", value: $viewModel.newRoom.timePerTurn, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(width: 50)
                    .multilineTextAlignment(.trailing)
                    
            }
            HStack {
                Text("Max players")
                
                Spacer()
                
                TextField("Players", value: $viewModel.newRoom.maxPlayers, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(width: 50)
                    .multilineTextAlignment(.trailing)
                    
            }
            
            Spacer()
            
            Button("Create") {
                //viewModel.login()
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
        .padding()
    }
}
 
#Preview {
    CreateRoomView(viewModel: .init())
}
