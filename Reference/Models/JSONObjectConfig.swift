//
//  JSONObjectConfig.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import Foundation

struct JSONObjectConfig: Codable {
    var mode: String
    var duration: Int
    var tweaks: [JSONArrayConfig]
}
