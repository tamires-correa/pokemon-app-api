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
        case .normal: return .blue.opacity(0.3)
        case .fire: return .red
        case .water: return .blue
        case .grass: return .green
        case .electric: return .yellow
        case .ice: return .cyan
        case .fighting: return .brown
        case .poison: return .purple
        case .ground: return .orange
        case .flying: return .blue.opacity(0.7)
        case .dragon: return .orange.opacity(0.7)
        case .dark: return .black
        case .steel: return .gray
        case .fairy: return .pink
        case .ghost: return .purple.opacity(0.7)
        case .psychic: return .purple.opacity(0.85)
        case .rock: return .brown.opacity(0.7)
        case .bug: return .green.opacity(0.7)
        }
    }
}
