//
//  HomeViewModel.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import Foundation
import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {

    @Binding var isAuth: Bool
    
    init(isAuth: Binding<Bool>) {
        _isAuth = isAuth
    }
}
