//
//  AttributionDetailsView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct AttributionDetailsView: View {
    @StateObject var attributionDetailsVM = AttributionDetailsVM()
    
    var attributionDetails: AttributionDetails
    
    var body: some View {
        VStack {
            if attributionDetailsVM.license != nil {
                ScrollView {
                    Text(attributionDetailsVM.license!)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                        .font(.system(size: 7, design: .monospaced))
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
                Link(destination: URL(string: attributionDetails.homeUrl)!) {
                    Image(systemName: "link")
                }
            }
        }
        .task {
            attributionDetailsVM.fetchLicense(attributionDetails.licenseUrl)
        }
    }
}
