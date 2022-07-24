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
    @AppStorage("accentColor") var accentColor: Color = .red
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(appAppearance.colorScheme)
                .accentColor(accentColor)
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
