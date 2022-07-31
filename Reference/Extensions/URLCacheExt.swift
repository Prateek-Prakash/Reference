//
//  URLCacheExtension.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
