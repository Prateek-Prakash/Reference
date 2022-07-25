//
//  FakeryDataVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import Fakery
import SwiftUI

class FakeryDataVM: ObservableObject {
    @Published var mock = Faker(locale: "en-US")
    
    func refreshMock() {
        mock = Faker(locale: "en-US")
    }
}
