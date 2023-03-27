//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Aymeric Pilaert on 27/03/2023.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @EnvironmentObject var prospects: Prospects
    let filter: FilterType
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading){
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                        
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    let prospect = Prospect()
                    prospect.name = "Aymeric"
                    prospect.emailAddress = "aymeric@gmail.com"
                    prospects.people.append(prospect)
                } label: {
                    Label("scan", systemImage: "qrcode.viewfinder")
                    }
                }
        }
    }
    
    var title: String {
        switch filter {
        case .none :
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect]{
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter {$0.isContacted}
        case .uncontacted:
            return prospects.people.filter {!$0.isContacted}
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
