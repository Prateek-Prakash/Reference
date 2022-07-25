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
    case green = "Green"
    case mint = "Mint"
    case orange = "Orange"
    
    var baseColor: Color {
        switch self {
        case .red:
            return .red
        case .black:
            return .black
        case .blue:
            return .blue
        case .purple:
            return .purple
        case .green:
            return .green
        case .mint:
            return .mint
        case .orange:
            return .orange
        }
    }
}

extension AppIcon: BetterListPickerSelectable, Identifiable {
    var id: String { rawValue }
    var title: String { rawValue }
}
