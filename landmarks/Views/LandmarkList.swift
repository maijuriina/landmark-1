//
//  LandmarkList.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { // create List, which is passed landmarks
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
        LandmarkList()
    }
}