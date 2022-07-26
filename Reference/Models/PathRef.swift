//
//  FilePath.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import Foundation

struct PathRef: Identifiable {
    var id: UUID = UUID()
    var title: String
    var icon: String
    var children: [PathRef]?
}
