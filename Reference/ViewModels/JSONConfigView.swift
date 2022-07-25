//
//  JSONConfigView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import SwiftUI

struct JSONConfigView: View {
    var jsonConfig: JSONConfig
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Mode")
                        .badge(jsonConfig.mode)
                    Text("Duration")
                        .badge(jsonConfig.duration)
                }
                
                Section("TWEAKS") {
                    ForEach(jsonConfig.tweaks) { tweak in
                        Text(tweak.name)
                            .badge(tweak.damage >= 0 ? "+\(tweak.damage)" : tweak.damage.description)
                    }
                }
            }
            .navigationTitle("JSON Config")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
