//
//  ReferenceApp.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

@main
struct ReferenceApp: App {
    @AppStorage("appAppearance") var appAppearance: AppAppearance = .system
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(appAppearance.colorScheme)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
