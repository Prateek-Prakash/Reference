//
//  AttributionDetailsVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class AttributionDetailsVM: ObservableObject {
    @Published var license: String?
    
    func fetchLicense(_ licenseUrl: String) {
        let url = URL(string: licenseUrl)
        license = try! String(contentsOf: url!, encoding: .ascii)
    }
}
