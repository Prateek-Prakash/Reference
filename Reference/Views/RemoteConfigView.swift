//
//  RemoteConfigView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import SwiftUI

struct RemoteConfigView: View {
    @StateObject var remoteConfigVM = RemoteConfigVM()
    
    var body: some View {
        VStack {
            VStack {
                if remoteConfigVM.didPullConfig {
                    List {
                        Section("BASIC CONFIG") {
                            Text("String Config")
                                .badge(remoteConfigVM.stringValue)
                            Text("Number Config")
                                .badge(remoteConfigVM.numberValue.description)
                            Text("Boolean Config")
                                .badge(remoteConfigVM.boolValue.description.capitalized)
                        }
                        if let jsonConfig = remoteConfigVM.jsonConfig {
                            Section("JSON CONFIG (OBJECT)") {
                                Text("Mode")
                                    .badge(jsonConfig.mode)
                                Text("Duration")
                                    .badge(jsonConfig.duration)
                            }
                            
                            Section("JSON CONFIG (ARRAY)") {
                                ForEach(jsonConfig.tweaks) { tweak in
                                    Text(tweak.name)
                                        .badge(tweak.damage >= 0 ? "+\(tweak.damage)" : tweak.damage.description)
                                }
                            }
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Remote Config")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        Task {
                            try! await remoteConfigVM.fetchRemoteConfig()
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .task {
                try! await remoteConfigVM.fetchRemoteConfig()
            }
        }
    }
}
