//
//  AuthenticationVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import SwiftUI

enum AuthenticationMode: String, CaseIterable {
    case register = "Register"
    case login = "Login"
}

class AuthenticationVM: ObservableObject {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @Published var authenticationMode: AuthenticationMode = .register
    @Published var registerUsername: String = ""
    @Published var registerPassword: String = ""
    @Published var loginUsername: String = ""
    @Published var loginPassword: String = ""
}
