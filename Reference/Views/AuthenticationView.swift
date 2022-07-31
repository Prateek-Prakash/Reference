//
//  AuthenticationView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var authenticationVM = AuthenticationVM()
    
    var body: some View {
        VStack {
            VStack {
                Picker("Authentication Mode", selection: $authenticationVM.authenticationMode) {
                    ForEach(AuthenticationMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue)
                            .tag(mode)
                    }
                }
                .pickerStyle(.segmented)
                
                if authenticationVM.authenticationMode == .register {
                    VStack {
                        TextField("Email", text: $authenticationVM.registerEmail)
                        SecureField("Password", text: $authenticationVM.registerPassword)
                        Button {
                            authenticationVM.register()
                        } label: {
                            Text("REGISTER")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(authenticationVM.accentColor)
                        .clipShape(Capsule())
                    }
                    .textFieldStyle(.roundedBorder)
                } else if authenticationVM.authenticationMode == .login {
                    VStack {
                        TextField("Email", text: $authenticationVM.loginEmail)
                        SecureField("Password", text: $authenticationVM.loginPassword)
                        Button {
                            authenticationVM.login()
                        } label: {
                            Text("LOGIN")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(authenticationVM.accentColor)
                        .clipShape(Capsule())
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Authentication")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
