//
//  ModelData.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject { // SwiftUI subscribes to observable object and updates any views that need refreshing when data changes - Published attribute for the array allows subscribers to pick up changes
    @Published var landmarks: [Landmark] = load("landmarkData.json") // landmarks-array initialised from json-file
}

// load _: method fetches JSON data with a given name from the main bundle
// requires return type's Codable-protocol
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
