//
//  MainView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import BetterListPicker
import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainVM()
    
    init() {
        // Translucent TabBar
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("CUSTOMIZATION") {
                    BetterListPicker(mainVM.$appAppearance, pickerData: AppAppearance.allCases) {
                        Text("App Appearance")
                    } label: {
                        Text("App Appearance")
                    }
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
            .toolbar {
                Menu {
                    // Menu Items
                } label: {
                    Label("More", systemImage: "ellipsis.circle")
                }
            }
        }
    }
}
