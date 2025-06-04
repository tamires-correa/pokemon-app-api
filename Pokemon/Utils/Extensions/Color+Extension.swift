//
//  Color+Extension.swift
//  Pokemon
//
//  Created by Ricardo Salotti on 04/06/25.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var hexNumber: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&hexNumber) else { return nil }

        let r, g, b, a: Double
        switch hexSanitized.count {
        case 6: // RRGGBB
            r = Double((hexNumber & 0xFF0000) >> 16) / 255
            g = Double((hexNumber & 0x00FF00) >> 8) / 255
            b = Double(hexNumber & 0x0000FF) / 255
            a = 1.0
        case 8: // RRGGBBAA
            r = Double((hexNumber & 0xFF000000) >> 24) / 255
            g = Double((hexNumber & 0x00FF0000) >> 16) / 255
            b = Double((hexNumber & 0x0000FF00) >> 8) / 255
            a = Double(hexNumber & 0x000000FF) / 255
        default:
            return nil
        }

        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
    init(hex: String, default color: Color = .clear) {
        self = Color(hex: hex) ?? color
    }
}
