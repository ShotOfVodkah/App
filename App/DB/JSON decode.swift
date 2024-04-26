//
//  JSON decode.swift
//  App
//
//  Created by Stepan Polyakov on 28.03.2024.
//

import Foundation

struct scene: Codable {
    var id, next: Int16;
    var background, character, emotion, sentence,on_screen: String;
    
    static let allScenes1: [scene] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch1_dialogue_m.json") : Bundle.main.decode(file: "ch1_dialogue_f.json")
    static let sampleScene1: scene = allScenes1[0]
    
    static let allScenes2: [scene] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch2_dialogue_m.json") : Bundle.main.decode(file: "ch2_dialogue_f.json")
    static let sampleScene2: scene = allScenes2[0]
    
    static let allScenes3: [scene] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch3_dialogue_m.json") : Bundle.main.decode(file: "ch3_dialogue_f.json")
    static let sampleScene3: scene = allScenes3[0]
    
    static let allScenes4: [scene] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch4_dialogue_m.json") : Bundle.main.decode(file: "ch4_dialogue_f.json")
    static let sampleScene4: scene = allScenes4[0]
}

struct choice: Codable {
    var id, n1,n2,n3,n4: Int16;
    var c1,c2,c3,c4: String;
    
    static let allChoices1: [choice] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch1_choice_m.json") : Bundle.main.decode(file: "ch1_choice_f.json")
    static let sampleChoice1: choice = allChoices1[0]
    
    static let allChoices2: [choice] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch2_choice_m.json") : Bundle.main.decode(file: "ch2_choice_f.json")
    static let sampleChoice2: choice = allChoices2[0]
    
    static let allChoices3: [choice] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch3_choice_m.json") : Bundle.main.decode(file: "ch3_choice_f.json")
    static let sampleChoice3: choice = allChoices3[0]
    
    static let allChoices4: [choice] = selectedGender == "Мужской" ? Bundle.main.decode(file: "ch4_choice_m.json") : Bundle.main.decode(file: "ch4_choice_f.json")
    static let sampleChoice4: choice = allChoices4[0]
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data (contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        let decoder = JSONDecoder ( )
        guard let loadedData = try? decoder.decode(T.self, from:
                                                        data) else {
            fatalError("Could not load file in the protect!")
        }
        return loadedData
    }
}
