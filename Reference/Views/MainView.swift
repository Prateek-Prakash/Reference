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
                        Text("Appearance")
                    } label: {
                        Text("Appearance")
                    }
                    ColorPicker("Accent Color", selection: mainVM.$accentColor, supportsOpacity: false)
                    Text("App Icon")
                }
                
                Section("APPLE TECHNOLOGIES") {
                    Text("Core NFC")
                    Text("CloudKit")
                    Text("MapKit")
                    Text("StoreKit")
                }
                
                Section("GOOGLE FIREBASE") {
                    Text("Firestore")
                    Text("Analytics")
                }
                
                Section("OFFLINE DATABASE") {
                    Text("Core Data")
                    Text("Realm")
                }
                
                Section("MISCELLANEOUS") {
                    NavigationLink {
                        DeferView {
                            VariousLabelsView()
                        }
                    } label: {
                        Text("Various Labels")
                    }
                    Text("Various Forms")
                }
                
                Section("ABOUT") {
                    NavigationLink {
                        DeferView {
                            AttributionListView()
                        }
                    } label: {
                        Text("Attributions")
                    }
                }
            }
            .navigationTitle("Reference")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Menu {
                    
                } label: {
                    Label("More", systemImage: "ellipsis.circle")
                }
            }
        }
    }
}
