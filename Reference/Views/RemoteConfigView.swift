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
            List {
                Section {
                    Text("String Config")
                        .badge(remoteConfigVM.stringValue)
                    Text("Number Config")
                        .badge(remoteConfigVM.numberValue.description)
                    Text("Boolean Config")
                        .badge(remoteConfigVM.boolValue.description.capitalized)
                    if let jsonConfig = remoteConfigVM.jsonConfig {
                        NavigationLink {
                            DeferView {
                                JSONConfigView(jsonConfig: jsonConfig)
                            }
                        } label: {
                            Text("JSON Config")
                        }
                    }
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
