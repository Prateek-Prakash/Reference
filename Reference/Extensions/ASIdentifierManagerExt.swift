//
//  ASIdentifierManagerExt.swift
//  Reference
//
//  Created by Prateek Prakash on 3/20/23.
//

import AdSupport
import AppTrackingTransparency

extension ASIdentifierManager {
    static var identifierForAdvertising: String {
        if #available(iOS 14, *) {
            guard ATTrackingManager.trackingAuthorizationStatus == .authorized else {
                return ""
            }
        } else {
            guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
                return ""
            }
        }
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}
