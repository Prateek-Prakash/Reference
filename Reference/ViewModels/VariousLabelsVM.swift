//
//  VariousLabelsVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class VariousLabelsVM: ObservableObject {
    @Published var sampleLabels = [
        LabelDetails(title: "Authentication", systemName: "lock.fill", color: .green),
        LabelDetails(title: "Notifications", systemName: "bell.badge.fill", color: .red, badge: "10"),
        LabelDetails(title: "Configuration", systemName: "gearshape.2.fill", color: .gray)
    ]
}
