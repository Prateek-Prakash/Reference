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
                    BetterListPicker(mainVM.$appIcon, pickerData: AppIcon.allCases) {
                        Text("App Icon")
                    } label: {
                        Text("App Icon")
                    }
                    .onChange(of: mainVM.appIcon) { appIcon in
                        mainVM.setAppIcon(appIcon)
                    }
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
                    Text("Storage")
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
                    Text("Form Input")
                    Button {
                        mainVM.generateUUID()
                    } label: {
                        Text("Generate UUID")
                    }
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
            .navigationViewStyle(.stack)
            .toolbar {
                Menu {
                    Picker(selection: mainVM.$appAppearance, label: Text("Appearance")) {
                        ForEach(AppAppearance.allCases) {
                            Label($0.title, systemImage: $0.systemImage)
                                .tag($0)
                        }
                    }
                } label: {
                    Label("Appearance", systemImage: "ellipsis.circle")
                }
            }
        }
    }
}
