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
            name: "Firebase-iOS-SDK",
            homeUrl: "https://raw.githubusercontent.com/firebase/firebase-ios-sdk",
            licenseUrl: "https://raw.githubusercontent.com/firebase/firebase-ios-sdk/master/LICENSE"
        )
    ]
}
