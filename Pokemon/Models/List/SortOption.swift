//
//  SortOption.swift
//  Pokemon
//
//  Created by Tamires Corrêa on 08/06/25.
//


enum SortOption: String, CaseIterable {
    case number = "Número"
    case name = "Nome"
    
    var icon: String {
        switch self {
        case .number: return "ic_tag"
        case .name: return "ic_text"
        }
    }
}
