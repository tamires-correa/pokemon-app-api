//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 27/05/25.
//
import Foundation

struct PokemonDetail: Identifiable {
    let id = UUID()
    
    let types: [PokemonDetailTypes]
}
