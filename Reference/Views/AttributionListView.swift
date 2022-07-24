//
//  AttributionListView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct AttributionListView: View {
    var body: some View {
        VStack {
            List {
                NavigationLink {
                    EmptyView()
                } label: {
                    Text("BetterListPicker")
                }
            }
            .navigationTitle("Attributions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
