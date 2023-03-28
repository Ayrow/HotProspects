//
//  Prospect.swift
//  HotProspects
//
//  Created by Aymeric Pilaert on 27/03/2023.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    let savedData = FileManager.documentsDirectory.appendingPathComponent("savedProspects")
    
    init() {
        do {
            let data = try Data(contentsOf: savedData)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
       
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savedData, options: [.atomic, .completeFileProtection])
        } catch {
            print("Cannot save data")
        }
        
    }
    
    func toggle(_ prospect: Prospect){
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func addProspect(_ prospect: Prospect){
        people.append(prospect)
        save()
    }
    
}
