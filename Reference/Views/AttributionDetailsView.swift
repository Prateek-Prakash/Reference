//
//  AttributionDetailsView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct AttributionDetailsView: View {
    var attributionDetails: AttributionDetails
    
    @State var license: String?
    
    var body: some View {
        VStack {
            
            if license != nil {
                ScrollView {
                    Text(license!)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.secondary)
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle(attributionDetails.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Link(destination: URL(string: attributionDetails.url)!) {
                    Image(systemName: "link")
                }
            }
        }
        .task {
            let url = URL(string: attributionDetails.license)
            license = try! String(contentsOf: url!, encoding: .ascii)
        }
    }
}
