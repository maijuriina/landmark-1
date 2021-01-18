//
//  FavoriteButton.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 18/01/2021.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool // binding means changes made inside this view propagate back to the data source (JSON-file)
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart") // changes appearance based on state of toggle
                .foregroundColor(isSet ? Color.red : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
