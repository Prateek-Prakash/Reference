//
//  JSONConfig.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import Foundation

struct JSONConfig: Codable {
    var mode: String
    var duration: Int
    var tweaks: [TweakConfig]
}
