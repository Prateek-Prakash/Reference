//
//  MainView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import AVKit
import BetterListPicker
import SwiftUI

struct MainView: View {
    @StateObject var mainVM = MainVM()
    
    @State var isAVKitPlayerPresented = false
    
    init() {
        // Picture-In-Picture
        try? AVAudioSession.sharedInstance().setCategory(.playback)
    }
    
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
                    NavigationLink {
                        DeferView {
                            MapKitView()
                        }
                    } label: {
                        Text("MapKit")
                    }
                    Text("SceneKit")
                    Text("StoreKit")
                    NavigationLink {
                        DeferView {
                            VisionView()
                        }
                    } label: {
                        Text("Vision")
                    }
                }
                
                Section("GOOGLE FIREBASE") {
                    Text("AdMob")
                    Text("Authentication")
                    Text("Firestore")
                    Text("Analytics")
                    Text("Storage")
                    NavigationLink {
                        DeferView {
                            RemoteConfigView()
                        }
                    } label: {
                        Text("Remote Config")
                    }
                }
                
                Section("OFFLINE DATABASE") {
                    Text("Core Data")
                    Text("Realm")
                    Text("SQLite")
                    Text("Device Storage")
                }
                
                Section("VIDEO PLAYER") {
                    Button(action: {
                        self.isAVKitPlayerPresented = true
                    }) {
                        Text("AVKit Player")
                    }
                    .fullScreenCover(isPresented: self.$isAVKitPlayerPresented) {
                        AVKitPlayerView(videoURL: "https://bit.ly/30r65im")
                    }
                    Text("VLCKit Player")
                }
                
                Section("MISCELLANEOUS") {
                    NavigationLink {
                        DeferView {
                            HierarchicalListView()
                        }
                    } label: {
                        Text("Hierarchical List")
                    }
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
                            Label($0.title, systemImage: $0.systemImage).tag($0)
                        }
                    }
                    
                    Picker(selection: mainVM.$appIcon, label: Text("App Icon")) {
                        ForEach(AppIcon.allCases) {
                            Text($0.title).tag($0)
                        }
                    }
                } label: {
                    Label("Customization", systemImage: "paintbrush.pointed")
                }
            }
        }
    }
}
