//
//  PokemonCard.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 13/05/25.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        containerView
    }
    
    private var containerView: some View {
        VStack {
            HStack {
                Spacer()
                Text("#001") //Precisa recuperar o numero
                    .font(.system(size: 8, weight: .light))
                    .foregroundColor(Color(hex: "#666666"))
                    .padding(.trailing, 8)
                    .padding(.top, 4)
            }
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color(hex: "#EFEFEF"))
                    .frame(height: 44)
                    .cornerRadius(8)
                Text(pokemon.data.name.capitalized)
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(Color(hex: "#1D1D1D"))
                    .padding(.top, 20)
            }
        }
        .overlay {
            AsyncImage(url: pokemon.cover.image) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(hex: "#DC0A2D"))
            }
            .frame(width: 72, height: 72)
            .clipped()
        }
        .frame(width: 104, height: 108)
        .background(
            Color.white
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.5), radius: 2)
        )
    }
}

#Preview {
    PokemonCard(pokemon: .init(data: .init(name: "Pikachu"), cover: .init(indexImage: 25)))
}
