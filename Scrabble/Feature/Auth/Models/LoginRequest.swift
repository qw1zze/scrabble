//
//  LoginRequest.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

struct LoginRequest: Codable {
    var email: String
    var password: String
}

struct LoginResponse: Codable {
    let id: String
    let value: String
    let user: LoginUser
}

struct LoginUser: Codable {
    let id: String
}
