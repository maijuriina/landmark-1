//
//  MapView.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region) // $ passes a binding referencing an underlying value, updating as the user interacts with the map
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) { // method updates region based on coordinate value
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView(coordinate: CLLocationCoordinate2D(latitude:34.011_286, longitude: -116.166_868)) // pass coordinate parameter of the map view
        }
    }
}
