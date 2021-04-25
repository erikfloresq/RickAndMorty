//
//  MainView.swift
//  RickAndMorty
//
//  Created by Erik Flores on 24/4/21.
//

import SwiftUI

enum MainViewTab: Hashable {
    case characters
    case locations
}

struct MainView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView(selection: $appState.tabSelected) {
            CharacterListView()
                .tabItem {
                    Text("Characters")
                }.tag(MainViewTab.characters)
            LocationsView()
                .tabItem {
                    Text("Locations")
                }.tag(MainViewTab.locations)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
