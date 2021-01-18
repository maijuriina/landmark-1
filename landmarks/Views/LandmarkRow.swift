//
//  LandmarkRow.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark // make landmark a stored property of LandmarkRow
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .padding(5)
            Text(landmark.name)
            
            Spacer() // adds space at the end of horizontal stack
            
            if landmark.isFavorite { // in SwiftUI use if statement to conditionally include views
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group{
            // add landmark to initializer from a position of array
            LandmarkRow(landmark:landmarks[0])
            LandmarkRow(landmark:landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
