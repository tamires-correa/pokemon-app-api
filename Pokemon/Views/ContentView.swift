//
//  ContentView.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State var pokemons: [Pokemon] = []
    
    //TODO: - Ajustar o Filtro não está como o Figma
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.data.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                headerView
                searchBarView
                pokemonGridView
            }
            .padding(.bottom, 16)
            .background {
                Color(hex: "#DC0A2D")
                    .ignoresSafeArea(.all)
            }
            .onAppear {
                //TODO: - Melhorar... usar um modelo MVVM ?
                guard pokemons.isEmpty else { return }
                Task {
                    do {
                        let pokemonsData = try await Network.shared.fetchList()
                        pokemons = pokemonsData.enumerated().map { (index, data) in
                            Pokemon(data: data, cover: .init(indexImage: index + 1))
                        }
                    } catch {
                        //TODO: - Tratar Erro (Alerta para tentar recarregar) ?
                        print(error)
                    }
                }
            }
        }
    }
    
   private var headerView: some View {
        HStack(spacing: 24) {
            Image("ic_small_pokeball")
                .foregroundStyle(.white)
                .padding(.leading, 24)
            Text("Pokédex")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                
            Spacer()
        }
    }
    
    private var searchBarView: some View {
        HStack(spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "DC0A2D"))
                    .padding(.leading, 8)
                TextField("Search", text: $searchText)
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(24)
            .padding(.leading, 24)
            Button(action: {
                //TODO: - Fazer a ação deste botão 
            }) {
                ZStack {
                    Color.white
                    Image("ic_tag")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(hex: "DC0A2D"))
                        .frame(width: 24, height: 24)
                }
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.trailing, 24)
        }
    }
    
    @ViewBuilder
    private var pokemonGridView: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 0)], spacing: 8) {
                    ForEach(filteredPokemons) { pokemon in
                        NavigationLink(destination: DetailView(pokemon: pokemon, onDelete: {})) {
                            PokemonCard(pokemon: pokemon)
                                .padding(4)
                        }
                    }
                }
                .padding(.vertical, 25)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal, 8)
    }
}

#Preview {
    ContentView()
}
