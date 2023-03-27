//
//  ContentView.swift
//  HotProspects
//
//  Created by Aymeric Pilaert on 27/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ProspectsView()
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView()
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }

            ProspectsView()
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
