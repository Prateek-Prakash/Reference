//
//  AttributionListView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct AttributionListView: View {
    @StateObject var attributionListVM = AttributionListVM()
    
    var body: some View {
        VStack {
            List {
                ForEach(attributionListVM.attributions) { attributionDetails in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Text(attributionDetails.name)
                    }
                }
            }
            .navigationTitle("Attributions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
