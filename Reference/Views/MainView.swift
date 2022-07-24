//
//  MainView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct MainView: View {
    init() {
        // Translucent TabBar
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("CUSTOMIZATION") {
                    Text("Appearance")
                    Text("Accent Color")
                    Text("App Icon")
                }
                
                Section("CORENFC") {
                    Text("NFC Reader")
                    Text("NFC Writer")
                }
                
                Section("GOOGLE FIREBASE") {
                    Text("Firestore")
                    Text("Analytics")
                }
                
                Section("OFFLINE DATABASE") {
                    Text("CoreData")
                    Text("RealmDB")
                }
                
                Section("SETTINGS") {
                    Text("Category Labels")
                    Text("Various Forms")
                }
                
                Section("ABOUT") {
                    Text("Acknowledgments")
                }
            }
            .navigationTitle("Reference")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
