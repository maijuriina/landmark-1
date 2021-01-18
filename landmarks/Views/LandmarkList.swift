//
//  LandmarkList.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) // check showFavOnly property and each .isFavorite-value
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredLandmarks) { // create List, which is passed landmarks
                landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) { // pass current landmark to destination
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch) (2nd generation)"], id: \.self) { deviceName in
            LandmarkList()
                // .previewDevice(PreviewDevice(rawValue: deviceName))
                // .previewDisplayName(deviceName)
        //}
    }
}
