//
//  landmarksApp.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

@main
struct landmarksApp: App {
    @StateObject private var modelData = ModelData() // initialize model object instance ONLY ONCE DURING LIFE TIME OF APP
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData) // supply modelData to contentView
        }
    }
}
