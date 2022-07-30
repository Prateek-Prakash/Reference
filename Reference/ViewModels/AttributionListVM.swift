//
//  AttributionListVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class AttributionListVM: ObservableObject {
    @Published var attributions = [
        AttributionDetails(
            name: "BetterListPicker",
            homeUrl: "https://github.com/Jinya/BetterListPicker",
            licenseUrl: "https://raw.githubusercontent.com/Jinya/BetterListPicker/main/LICENSE"
        ),
        AttributionDetails(
            name: "Darknet",
            homeUrl: "https://github.com/pjreddie/darknet",
            licenseUrl: "https://raw.githubusercontent.com/pjreddie/darknet/master/LICENSE.mit"
        ),
        AttributionDetails(
            name: "Fakery",
            homeUrl: "https://raw.githubusercontent.com/vadymmarkov/Fakery",
            licenseUrl: "https://raw.githubusercontent.com/vadymmarkov/Fakery/master/LICENSE.md"
        ),
        AttributionDetails(
            name: "Firebase-iOS-SDK",
            homeUrl: "https://raw.githubusercontent.com/firebase/firebase-ios-sdk",
            licenseUrl: "https://raw.githubusercontent.com/firebase/firebase-ios-sdk/master/LICENSE"
        ),
        AttributionDetails(
            name: "Realm-Swift",
            homeUrl: "https://raw.githubusercontent.com/realm/realm-swift",
            licenseUrl: "https://raw.githubusercontent.com/realm/realm-swift/master/LICENSE"
        )
    ]
}
