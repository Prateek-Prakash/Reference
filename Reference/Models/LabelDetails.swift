//
//  LabelDetails.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct LabelDetails: Identifiable {
    var id: UUID = UUID()
    var title: String
    var systemName: String
    var color: Color
    var badge: String = ""
}
