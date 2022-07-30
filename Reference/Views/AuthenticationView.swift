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
                        TextField("Username", text: $authenticationVM.registerUsername)
                        SecureField("Password", text: $authenticationVM.registerPassword)
                        Button {
                            // Register Action
                        } label: {
                            Text("REGISTER")
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .buttonStyle(.bordered)
                        .tint(authenticationVM.accentColor)
                    }
                    .textFieldStyle(.roundedBorder)
                } else if authenticationVM.authenticationMode == .login {
                    VStack {
                        TextField("Username", text: $authenticationVM.loginUsername)
                        SecureField("Password", text: $authenticationVM.loginPassword)
                        Button {
                            // Login Action
                        } label: {
                            Text("LOGIN")
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .buttonStyle(.bordered)
                        .tint(authenticationVM.accentColor)
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
