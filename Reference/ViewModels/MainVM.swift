//
//  MainVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class MainVM: ObservableObject {
    @AppStorage("appAppearance") var appAppearance: AppAppearance = .system
    @AppStorage("accentColor") var accentColor: Color = .red
    
    func generateUUID() {
        let uuid = UUID().uuidString
        UIPasteboard.general.string = uuid
        print(uuid)
    }
}
