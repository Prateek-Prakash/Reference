//
//  AppIcon.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import BetterListPicker
import SwiftUI

enum AppIcon: String, CaseIterable {
    case black = "AppIcon Black"
    case blue = "AppIcon Blue"
    case green = "AppIcon Green"
    case mint = "AppIcon Mint"
    case orange = "AppIcon Orange"
    case purple = "AppIcon Purple"
    case red = "AppIcon Red"
    
    var baseColor: Color {
        switch self {
        case .black:
            return .black
        case .blue:
            return .blue
        case .green:
            return .green
        case .mint:
            return .mint
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .red:
            return .red
        }
    }
    
    var assetName: String? {
        switch self {
        case .black:
            return nil
        case .blue:
            return "AppIcon-Blue"
        case .green:
            return "AppIcon-Green"
        case .mint:
            return "AppIcon-Mint"
        case .orange:
            return "AppIcon-Orange"
        case .purple:
            return "AppIcon-Purple"
        case .red:
            return "AppIcon-Red"
        }
    }
}

extension AppIcon: BetterListPickerSelectable, Identifiable {
    var id: String { rawValue }
    var title: String { rawValue }
}
