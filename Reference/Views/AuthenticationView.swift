//
//  AuthenticationView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import SwiftUI
import ToastUI

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
                .padding(.bottom)
                
                if authenticationVM.authenticationMode == .login {
                    if authenticationVM.loginStatus {
                        VStack {
                            Button {
                                authenticationVM.logout()
                            } label: {
                                Text("LOGOUT")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            }
                            .background(.regularMaterial, in: Capsule())
                        }
                    } else {
                        VStack {
                            TextField("Email", text: $authenticationVM.loginEmail)
                            SecureField("Password", text: $authenticationVM.loginPassword)
                                .padding(.bottom)
                            Button {
                                authenticationVM.login()
                            } label: {
                                Text("LOGIN")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            }
                            .background(.regularMaterial, in: Capsule())
                        }
                        .textFieldStyle(.roundedBorder)
                    }
                } else if authenticationVM.authenticationMode == .register {
                    VStack {
                        TextField("Email", text: $authenticationVM.registerEmail)
                        SecureField("Password", text: $authenticationVM.registerPassword)
                            .padding(.bottom)
                        Button {
                            authenticationVM.register()
                        } label: {
                            Text("REGISTER")
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(.regularMaterial, in: Capsule())
                    }
                    .textFieldStyle(.roundedBorder)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Authentication")
            .navigationBarTitleDisplayMode(.inline)
            .toast(isPresented: $authenticationVM.loginToastShowing, dismissAfter: 2) {
                if authenticationVM.loginToastResult == .success {
                    ToastView("Login \(authenticationVM.loginToastResult.rawValue)")
                        .toastViewStyle(.success)
                } else {
                    ToastView("Login \(authenticationVM.loginToastResult.rawValue)")
                        .toastViewStyle(.failure)
                }
            }
            .toast(isPresented: $authenticationVM.logoutToastShowing, dismissAfter: 2) {
                if authenticationVM.logoutToastResult == .success {
                    ToastView("Logout \(authenticationVM.loginToastResult.rawValue)")
                        .toastViewStyle(.success)
                } else {
                    ToastView("Logout \(authenticationVM.loginToastResult.rawValue)")
                        .toastViewStyle(.failure)
                }
            }
            .toast(isPresented: $authenticationVM.registerToastShowing, dismissAfter: 2) {
                if authenticationVM.registerToastResult == .success {
                    ToastView("Registration \(authenticationVM.registerToastResult.rawValue)")
                        .toastViewStyle(.success)
                } else {
                    ToastView("Registration \(authenticationVM.registerToastResult.rawValue)")
                        .toastViewStyle(.failure)
                }
            }
        }
    }
}
