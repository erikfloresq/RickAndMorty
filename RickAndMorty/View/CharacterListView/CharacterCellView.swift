//
//  CharacterCellView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 23/02/21.
//

import SwiftUI

struct CharacterCellView: View {
    var character: Character
    @ObservedObject var viewModel = CharacterCellViewModel()
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            if let  photoData = viewModel.photoData {
                Image(uiImage: UIImage(data: photoData) ?? UIImage())
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .frame(width: 100, height: 100)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            Text(character.name)
        }.onAppear {
            viewModel.setPhoto(from: character.image)
        }
        
    }
}
