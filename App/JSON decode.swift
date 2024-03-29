//
//  JSON decode.swift
//  App
//
//  Created by Stepan Polyakov on 28.03.2024.
//

import Foundation

struct scene: Codable {
    var id, next: Int16;
    var background, character, emotion, sentence: String;
    
    static let allScenes: [scene] = Bundle.main.decode(file: "ch1_dialogue_m.json")
    static let sample: scene = allScenes[0]
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
