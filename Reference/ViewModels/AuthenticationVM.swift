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
    case login = "Login"
    case register = "Register"
}

enum AuthenticationResult: String {
    case success = "Success"
    case failure = "Failure"
}

class AuthenticationVM: ObservableObject {
    @AppStorage("accentColor") var accentColor: Color = .red
    @AppStorage("loginStatus") var loginStatus = false
    @AppStorage("loginEmail") var loginEmail: String = ""
    @AppStorage("loginPassword") var loginPassword: String = ""
    
    @Published var authenticationMode: AuthenticationMode = .login
    
    @Published var registerEmail: String = ""
    @Published var registerPassword: String = ""
    @Published var registerToastShowing = false
    @Published var registerToastResult: AuthenticationResult = .success
    
    @Published var loginToastShowing = false
    @Published var loginToastResult: AuthenticationResult = .success
    
    @Published var logoutToastShowing = false
    @Published var logoutToastResult: AuthenticationResult = .success
    
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
                self.loginToastResult = .success
                self.loginToastShowing = true
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            loginStatus = false
            loginEmail = ""
            loginPassword = ""
            self.logoutToastResult = .success
            self.logoutToastShowing = true
        } catch let error {
            print(error.localizedDescription)
            self.logoutToastResult = .failure
            self.logoutToastShowing = true
        }
    }
}
