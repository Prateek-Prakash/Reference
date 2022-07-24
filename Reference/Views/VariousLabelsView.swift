//
//  VariousLabelsView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct VariousLabelsView: View {
    @StateObject var variousLabelsVM = VariousLabelsVM()
    
    var body: some View {
        VStack {
            List {
                Section("Basic Label") {
                    ForEach(variousLabelsVM.sampleLabels) { labelDetails in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Label(labelDetails.title, systemImage: labelDetails.systemName)
                                .labelStyle(.titleOnly)
                                .badge(labelDetails.badge)
                        }
                    }
                }
                
                Section("Icon Label") {
                    ForEach(variousLabelsVM.sampleLabels) { labelDetails in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Label(labelDetails.title, systemImage: labelDetails.systemName)
                                .foregroundColor(.white)
                                .badge(labelDetails.badge)
                        }
                    }
                }
                
                Section("Colored Icon Label") {
                    ForEach(variousLabelsVM.sampleLabels) { labelDetails in
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Label(labelDetails.title, systemImage: labelDetails.systemName)
                                .labelStyle(ColoredIconLabelStyle(color: labelDetails.color, size: 1))
                                .badge(labelDetails.badge)
                        }
                    }
                }
            }
            .navigationTitle("Various Labels")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
