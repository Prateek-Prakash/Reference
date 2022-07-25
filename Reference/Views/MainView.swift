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
    
    var body: some View {
        NavigationView {
            List {
                Section("CUSTOMIZATION") {
                    BetterListPicker("Appearance", selection: mainVM.$appAppearance, pickerData: AppAppearance.allCases)
                    ColorPicker("Accent Color", selection: mainVM.$accentColor, supportsOpacity: false)
                    BetterListPicker("App Icon", selection: mainVM.$appIcon, pickerData: AppIcon.allCases)
                    .onChange(of: mainVM.appIcon) { appIcon in
                        mainVM.setAppIcon(appIcon)
                    }
                }
                
                Section("APPLE TECHNOLOGIES") {
                    Text("ARKit")
                    Text("Core NFC")
                    Text("CloudKit")
                    Text("MapKit")
                    Text("SceneKit")
                    Text("StoreKit")
                    Text("VisionKit")
                }
                
                Section("GOOGLE FIREBASE") {
                    Text("Firestore")
                    Text("Analytics")
                    Text("Storage")
                    Text("Remote Config")
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
                    NavigationLink {
                        DeferView {
                            FakeryDataView()
                        }
                    } label: {
                        Text("Fakery Data")
                    }
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
