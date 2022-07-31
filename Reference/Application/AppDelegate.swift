//
//  AppDelegate.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import Firebase
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    @AppStorage("loginStatus") var loginStatus = false
    @AppStorage("loginEmail") var loginEmail: String = ""
    @AppStorage("loginPassword") var loginPassword: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let providerFactory = AppCheckFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        FirebaseApp.configure()
        if !loginEmail.isEmpty {
            Auth.auth().signIn(withEmail: loginEmail, password: loginPassword) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    self.loginStatus = false
                    return
                }
                
                if result?.user != nil {
                    self.loginStatus = true
                }
            }
        }
        return true
    }
}
