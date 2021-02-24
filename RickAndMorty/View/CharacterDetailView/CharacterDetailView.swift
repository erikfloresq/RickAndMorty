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
        VStack(alignment: .leading, spacing: 10) {
            Rectangle().frame(height: 300).scaledToFill().background(Color.gray)
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name")
                    Text("Planet")
                }.frame(width: 100)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Erik")
                    Text("Flores")
                }
            }
            Spacer()
        }.ignoresSafeArea()
    }
}

//struct CharacterDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterDetailView()
//    }
//}
