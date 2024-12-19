//
//  WebService.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 8/12/24.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(message: String)
}

class Webservice {
    static let url = "http://127.0.0.1:8080/api/v1/"
    
    func register(body: RegisterRequest, completion: @escaping (Result<RegisterResponse, AuthenticationError>) -> Void) {
        guard let url = URL(string: Webservice.url + "auth/register") else {
            completion(.failure(.invalidCredentials))
            return
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let body = try? JSONEncoder().encode(body) else {
            completion(.failure(.custom(message: "Invalid body")))
            return
        }
        request.httpBody = body
                
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
            guard let data = data, error == nil else {
                completion(.failure(.custom(message: "No data")))
                return
            }
                    
            guard let registerResponse = try? JSONDecoder().decode(RegisterResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
                    
            completion(.success(registerResponse))
        }.resume()
    }
    
    
    func register(body: RegisterRequest) async -> Result<RegisterResponse, AuthenticationError> {
        guard let url = URL(string: Webservice.url + "auth/register") else {
            return .failure(.invalidCredentials)
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let body = try? JSONEncoder().encode(body) else {
            return .failure(.custom(message: "Invalid body"))
        }
        request.httpBody = body
                
        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            if let registerResponse = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
                return .success(registerResponse)
            } else {
                return .failure(.invalidCredentials)
            }
        } catch {
            return .failure(.custom(message: "No data"))
        }
    }
    
    func login(body: LoginRequest) async -> Result<LoginResponse, AuthenticationError> {
        guard let url = URL(string: Webservice.url + "auth/login") else {
            return .failure(.invalidCredentials)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var loginString = body.email + ":" + body.password
        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return .failure(.invalidCredentials)
        }
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
                
        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                return .success(loginResponse)
            } else {
                return .failure(.invalidCredentials)
            }
        } catch {
            return .failure(.custom(message: "No data"))
        }
    }
    
    func deleteAccount(token: String) async -> Result<String, AuthenticationError> {
        guard let url = URL(string: Webservice.url + "users/delete") else {
            return .failure(.invalidCredentials)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                
        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            if let code = try? JSONDecoder().decode(String.self, from: data) {
                return .success(code)
            } else {
                return .failure(.invalidCredentials)
            }
        } catch {
            return .failure(.custom(message: "No data"))
        }
    }
}
