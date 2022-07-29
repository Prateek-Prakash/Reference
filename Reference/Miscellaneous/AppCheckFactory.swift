//
//  AppCheckFactory.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Firebase
import Foundation

class AppCheckFactory: NSObject, AppCheckProviderFactory {
    func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
        if #available(iOS 14.0, *) {
            return AppAttestProvider(app: app)
        } else {
            return DeviceCheckProvider(app: app)
        }
    }
}
