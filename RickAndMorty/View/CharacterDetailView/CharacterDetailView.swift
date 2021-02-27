//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 24/02/21.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            DetailBanner(photoData: $viewModel.photoData, title: viewModel.character.name)
                .onAppear {
                    viewModel.getPhoto()
                }
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name")
                    Text("Status")
                    Text("Species")
                    Text("Type")
                    Text("Gender")
                    Text("Origin")
                    Text("Location")
                    Text("Episode")
                }.frame(width: 100)
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.character.name)
                    Text(viewModel.character.status)
                    Text(viewModel.character.species)
                    Text(viewModel.character.type)
                    Text(viewModel.character.gender)
                    Text(viewModel.character.origin.name)
                    Text(viewModel.character.location.name)
                    Text("\(viewModel.character.episode.count)")
                }
            }
            Spacer()
        }.ignoresSafeArea()
    }
    
    struct DetailImage: View {
        @Binding var photoData: Data?
        
        var body: some View {
            if let photoData = photoData {
                Image(uiImage: UIImage(data: photoData) ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
            } else {
                Rectangle()
                    .frame(height: 400)
                    .background(Color.gray)
            }
        }
    }
    
    struct DetailBanner: View {
        @Binding var photoData: Data?
        var title: String
        
        var body: some View {
            ZStack {
                DetailImage(photoData: $photoData)
                VStack {
                    Spacer()
                    Text(title)
                        .font(Font.title)
                        .bold()
                        .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                }
            }
            
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: MockCharacter.getCharacter()!))
    }
}
