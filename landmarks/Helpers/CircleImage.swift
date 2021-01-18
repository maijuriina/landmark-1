//
//  CircleImage.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct CircleImage: View {
    var image: Image // stored image property
    
    var body: some View {
        image // wrap and encapsulate modifiers
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock")) // the view's input parameter
    }
}
