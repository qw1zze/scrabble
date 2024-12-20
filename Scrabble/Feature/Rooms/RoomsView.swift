//
//  RoomsView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import SwiftUI


struct RoomsView: View {
    @State var showNewRoom = false
    
    var body: some View {
        NavigationView {
            HStack {
                randomRoom
                    .frame(height: 200)
                
                InviteRoom
            }
            .frame(height: 200)
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        showNewRoom.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showNewRoom) {
            CreateRoomView(viewModel: .init())
                .presentationDetents([.medium])
        }
    }
    
    var randomRoom: some View {
        VStack {
            Image(systemName: "dice")
                .resizable()
                .foregroundColor(.blue)
                .scaledToFit()
            
            Text("Random room")
                .font(.title2)
                .foregroundStyle(.blue)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.blue, lineWidth: 3)
        }
    }
    
    var InviteRoom: some View {
        VStack {
            Image(systemName: "pencil.line")
                .resizable()
                .foregroundColor(.blue)
                .scaledToFit()
            
            Text("Enter invite")
                .font(.title2)
                .foregroundStyle(.blue)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.blue, lineWidth: 3)
        }
    }
}

#Preview {
    RoomsView()
}
