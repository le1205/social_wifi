//
//  UserData.swift
//  Socialize
//
//  Created by BigBright on 11/27/23.
//

import Foundation

class UserData: ObservableObject {
    
    @Published var authToken: String = ""
    @Published var msg: String = ""
    @Published var user_id: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var tictok: String = ""
    @Published var instagram: String = ""
    @Published var facebook: String = ""
    @Published var snapchat: String = ""
    @Published var duration: CGFloat = 0.0
    
    func resetUserData() {
        DispatchQueue.main.async {
        self.authToken = ""
        }
        user_id = ""
        email = ""
        msg = ""
        duration = 0.0

    }
}
