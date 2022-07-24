//
//  ReferenceApp.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

@main
struct ReferenceApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
