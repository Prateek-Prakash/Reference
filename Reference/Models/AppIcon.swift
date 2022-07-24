//
//  AppIcon.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import BetterListPicker
import SwiftUI

enum AppIcon: String, CaseIterable {
    case red = "Red"
    case black = "Black"
    case blue = "Blue"
    case purple = "Purple"
}

extension AppIcon: BetterListPickerSelectable, Identifiable {
    var id: String { rawValue }
    var title: String { rawValue }
}
