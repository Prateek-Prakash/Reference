//
//  VariousLabelsVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class VariousLabelsVM: ObservableObject {
    @Published var labels = [
        LabelDetails(title: "Authentication", systemImage: "lock.fill", color: .green),
        LabelDetails(title: "Notifications", systemImage: "bell.badge.fill", color: .red, badge: "10"),
        LabelDetails(title: "Configuration", systemImage: "gearshape.2.fill", color: .gray)
    ]
}
