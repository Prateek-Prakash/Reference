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
                OutlineGroup(hierarchicalListVM.pathRefs, children: \.children) { pathRef in
                    HStack {
                        Image(systemName: pathRef.icon)
                        Text(pathRef.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Hierarchical List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
