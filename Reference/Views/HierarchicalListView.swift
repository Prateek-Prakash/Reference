//
//  HierarchicalListView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI

struct HierarchicalListView: View {
    @StateObject var hierarchicalListVM = HierarchicalListVM()
    
    var body: some View {
        VStack {
            List {
                ForEach(hierarchicalListVM.rawPaths, id: \.self) { path in
                    Text(path)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Hierarchical List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
