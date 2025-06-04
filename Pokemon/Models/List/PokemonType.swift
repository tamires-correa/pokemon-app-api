//
//  PokemonType.swift
//  Pokemon
//
//  Created by Ricardo Salotti on 27/05/25.
//

import SwiftUI

enum PokemonType: String, CaseIterable {
    case normal
    case fire
    case water
    case grass
    case electric
    case ice
    case fighting
    case poison
    case ground
    case flying
    case dragon
    case dark
    case steel
    case fairy
    case ghost
    case psychic
    case rock
    case bug
    
    var color: Color {
        switch self {
        case .normal: return Color(hex: "#AAA67F")
        case .fire: return Color(hex: "#F57D31")
        case .water: return Color(hex: "#6493EB")
        case .grass: return Color(hex: "#74CB48")
        case .electric: return Color(hex: "#F9CF30")
        case .ice: return Color(hex: "#9AD6DF")
        case .fighting: return Color(hex: "#C12239")
        case .poison: return Color(hex: "#A43E9E")
        case .ground: return Color(hex: "#DEC16B")
        case .flying: return Color(hex: "#A891EC")
        case .dragon: return Color(hex: "#7037FF")
        case .dark: return Color(hex: "#75574C")
        case .steel: return Color(hex: "#B7B9D0")
        case .fairy: return Color(hex: "#E69EAC")
        case .ghost: return Color(hex: "#70559B")
        case .psychic: return Color(hex: "#FB5584")
        case .rock: return Color(hex: "#B69E31")
        case .bug: return Color(hex: "#A7B723")
        }
    }
}
