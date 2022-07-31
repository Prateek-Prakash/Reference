//
//  AuthenticationVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import Firebase
import SwiftUI

enum AuthenticationMode: String, CaseIterable {
    case register = "Register"
    case login = "Login"
}

class AuthenticationVM: ObservableObject {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @Published var authenticationMode: AuthenticationMode = .register
    @Published var registerEmail: String = ""
    @Published var registerPassword: String = ""
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    
    func register() {
        Auth.auth().createUser(withEmail: registerEmail, password: registerPassword) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let user = result?.user {
                print(user)
            }
        }
    }
    
    func login() {
        
    }
}
