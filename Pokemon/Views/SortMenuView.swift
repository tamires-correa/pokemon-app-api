//
//  SortMenuView.swift
//  Pokemon
//
//  Created by Tamires Corrêa on 09/06/25.
//


import SwiftUI

struct SortMenuView: View {
    @Binding var sortOption: SortOption
    var onClose: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Ordenar por:")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(hex: "DC0A2D"))
            
            VStack(spacing: 0) {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Button(action: {
                        sortOption = option
                        withAnimation(.easeInOut(duration: 0.3)) {
                            onClose()
                        }
                    }) {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .stroke(Color(hex: "DC0A2D"), lineWidth: 2)
                                    .frame(width: 20, height: 20)
                                
                                if sortOption == option {
                                    Circle()
                                        .fill(Color(hex: "DC0A2D"))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(option.rawValue)
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if option != SortOption.allCases.last! {
                        Divider()
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .frame(maxWidth: 180)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "DC0A2D"), lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 2)
        .transition(.asymmetric(
            insertion: .scale.combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        ))
    }
}

