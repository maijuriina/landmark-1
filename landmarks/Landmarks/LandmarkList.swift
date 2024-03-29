//
//  LandmarkList.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData // modelData gets value automatically through EnvironObject applied to parent
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) // check showFavOnly property and each .isFavorite-value
        }
    }

    
    var body: some View {
        NavigationView {
            List { // adding isOn-toggle as first child of list binds to show FavoritesOnly
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in // combine static/dynamic views in a list with ForEach type instead of collection of data
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) { // pass current landmark to destination
                        LandmarkRow(landmark: landmark)
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationTitle("Landmarks")
            .navigationBarItems(trailing: EditButton())
        }
    }

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch) (2nd generation)"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                // .previewDevice(PreviewDevice(rawValue: deviceName))
                // .previewDisplayName(deviceName)
        //}
    }
}
    func delete(at offsets: IndexSet) {
        modelData.landmarks.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        modelData.landmarks.move(fromOffsets: source, toOffset: destination)
    }
    
}
