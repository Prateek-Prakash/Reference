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
            url: "https://github.com/Jinya/BetterListPicker",
            license: "https://raw.githubusercontent.com/Jinya/BetterListPicker/main/LICENSE"
        )
    ]
}
