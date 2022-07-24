//
//  AppIconVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

class AppIconVM: ObservableObject {
    @AppStorage("appIcon") var appIcon: AppIcon = .red
}
