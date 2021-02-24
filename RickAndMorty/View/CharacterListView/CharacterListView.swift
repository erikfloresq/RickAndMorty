//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 23/02/21.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.characters, id: \.self) { character in
                NavigationLink(destination: CharacterDetailView(),
                               label: {
                                CharacterCellView(character: character)
                })
            }.navigationTitle("Characters")
        }.onAppear(perform: {
            viewModel.getCharacters()
        })
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
