//
//  RoomsViewModel.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import Foundation

@MainActor
final class RoomsViewModel: ObservableObject {
    @Published
    var newRoom: NewRoom = .init(isPrivate: false, timePerTurn: nil, maxPlayers: nil)
    
    func create() {
        
    }
}

struct NewRoom: Codable {
    var isPrivate: Bool
    var timePerTurn: Int?
    var maxPlayers: Int?
}


