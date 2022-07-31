//
//  AuthenticationVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import Firebase
import SwiftUI
import ToastUI

enum AuthenticationMode: String, CaseIterable {
    case register = "Register"
    case login = "Login"
}

enum AuthenticationResult: String {
    case success = "Success"
    case failure = "Failure"
}

class AuthenticationVM: ObservableObject {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @Published var authenticationMode: AuthenticationMode = .register
    
    @Published var registerEmail: String = ""
    @Published var registerPassword: String = ""
    @Published var registerToastShowing = false
    @Published var registerToastResult: AuthenticationResult = .success
    
    @Published var loginStatus = false
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    @Published var loginToastShowing = false
    @Published var loginToastResult: AuthenticationResult = .success
    
    func register() {
        Auth.auth().createUser(withEmail: registerEmail, password: registerPassword) { result, error in
            if let error = error {
                print(error.localizedDescription)
                self.registerToastResult = .failure
                self.registerToastShowing = true
                return
            }
            
            if result?.user != nil {
                self.registerEmail = ""
                self.registerPassword = ""
                self.registerToastResult = .success
                self.registerToastShowing = true
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: loginEmail, password: loginPassword) { result, error in
            if let error = error {
                print(error.localizedDescription)
                self.loginToastResult = .failure
                self.loginToastShowing = true
                return
            }
            
            if result?.user != nil {
                self.loginStatus = true
                self.loginEmail = ""
                self.loginPassword = ""
                self.loginToastResult = .success
                self.loginToastShowing = true
            }
        }
    }
}
