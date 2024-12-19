//
//  SettingsView.swift
//  Scrabble
//
//  Created by Dmitriy Kalyakin on 19/12/24.
//

import SwiftUI

struct SettingsView: View {
    var settingsVC: SettingsViewModel
    
    var body: some View {
        List {
            Button("Logout") {
                settingsVC.logout()
            }
            Button("Delete account") {
                settingsVC.delete()
            }
        }

    }
}

#Preview {
    SettingsView(settingsVC: .init(isAuth: .constant(true)))
}
