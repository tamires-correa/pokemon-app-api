//
//  DetailViewl.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 13/05/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    let pokemon: Pokemon
    @State var detail: PokemonDetail?
    @State var showAlert: Bool = false
    let onDelete: () -> Void
    
    var body: some View {
//        VStack {
//            HStack {
//                AsyncImage(url: pokemon.cover.image) { image in
//                    image.image?.resizable()
//                }
//                .padding(12)
//                .background {
//                    if let _ = detail {
//                        self.getPokemonBackgroundColor()
//                    }
//                }
//                .frame(width: 120, height: 120)
//                .clipShape(.circle)
//                VStack(alignment: .leading) {
//                    Text(pokemon.data.name.capitalized)
//                    HStack {
//                        if let detail {
//                            ForEach(detail.types) { detail in
//                                Text(detail.name)
//                            }
//                        }
//                    }
//                }
//                Spacer()
//                Button (action:{
//                    showAlert.toggle()
//                }) {
//                    Image(systemName: "x.circle.fill")
//                        .resizable()
//                        .foregroundStyle(.red)
//                        .frame(width: 24, height: 24)
//                }
//                .padding(.trailing, 8)
//                .alert(isPresented: $showAlert) {
//                    Alert(title: Text("Pokedex"), message: Text("Tem certeza que deseja remover \(pokemon.data.name.capitalized) do Pokédex?"), primaryButton: .cancel(Text("Cancelar"), action: {}), secondaryButton: .destructive(Text("Remover"), action: {
//                        onDelete()
//                        dismiss()
//                    }))
//                }
//            }
//            Spacer()
//        }
        ZStack(alignment: .top) {
            VStack {
                Spacer()
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(8)
                        .frame(height: 612)
                        .padding(.horizontal, 16)
                    AsyncImage(url: pokemon.cover.image) { image in
                        image.image?.resizable()
                    }
                    .frame(width: 200, height: 200)
                    .padding(.top, -150)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            backgroundView
                .ignoresSafeArea(.all)
        }
        .onAppear {
            Task {
                do {
                    let pokemonDetail = try await Network.shared.fetchDetail(name: pokemon.data.name)
                    detail = PokemonDetail(types: pokemonDetail.types.map({ detail in
                        PokemonDetailTypes(name: detail.type.name)
                    }))
                } catch {
                    
                }
            }
        }
    }
    
    func getPokemonBackgroundColor() -> Color? {
        if let detail = detail {
            return PokemonType.allCases.first(where: { $0.rawValue == detail.types.first?.name })?.color
        }
        return nil
    }
    
    @ViewBuilder
    var backgroundView: some View {
        ZStack(alignment: .topTrailing) {
            getPokemonBackgroundColor()
            HStack {
                Spacer()
                Image("ic_pokeball")
                    .opacity(0.1)
                    .padding(.top, 30)
            }
            .padding()
        }
    }
}

#Preview {
    DetailView(pokemon: .init(data: .init(name: "Bulbasaur"), cover: .init(indexImage: 1)), detail: nil, onDelete: {})
}
