//
//  LandmarkDetail.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 11/01/2021.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData : ModelData
    /*@Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false*/

    var landmark: Landmark // adds Landmark-property to LandmarkDetail-type, allowing access to Landmark data for custom types
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})! // compute index of input landmark by comparing with modelData
    }
    
    var body: some View {
        ScrollView { // ScrollView lets user scroll through descriptive content
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite) // provide binding to isFavorite with $
                    DeleteButton()
                }

                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)") // insert data from landmark using \()
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name) // gives navigation bar a title when showing detail view
        .navigationBarTitleDisplayMode(.automatic)
        
        
        /*Button(action: {
            self.showingAlert = true
        }) {
            Text("Show Alert")
                .font(.title)
                .foregroundColor(Color.white)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Delete landmark"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete")))
        }*/
        /*.alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete landmark"), message: Text("Are you sure?"), primaryButton:                        .destructive(Text("Delete")) {
                    self.deleteLandmark()
                }, secondaryButton: .cancel()
            )
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })*/
    }
    
    /*func deleteLandmark() {
        moc.delete(landmark)
        presentationMode.wrappedValue.dismiss()
    }*/
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    
    }
}
