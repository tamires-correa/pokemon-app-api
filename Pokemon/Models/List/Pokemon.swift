//
//  Pokemon.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 29/04/25.
//

import Foundation

struct Pokemon: Identifiable {
    let id = UUID()

    let data: PokemonDTO
    let cover: PokemonCover
}
