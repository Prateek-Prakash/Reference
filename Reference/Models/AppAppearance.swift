//
//  AppAppearance.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import BetterListPicker
import SwiftUI

enum AppAppearance: String, CaseIterable {
    case system = "System"
    case dark = "Dark"
    case light = "Light"
    
    var colorScheme: Optional<ColorScheme> {
        switch self {
        case .system:
            return .none
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

extension AppAppearance: BetterListPickerSelectable, Identifiable {
    var id: String { rawValue }
    var title: String { rawValue }
}
