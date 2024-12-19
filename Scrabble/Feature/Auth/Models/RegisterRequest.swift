//
//  Untitled.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

struct RegisterRequest: Codable {
    var username: String
    var email: String
    var password: String
}

struct RegisterResponse: Codable {
    let id: String
    let value: String
    let user: RegisterUser
}


struct RegisterUser: Codable {
    let id: String
}
