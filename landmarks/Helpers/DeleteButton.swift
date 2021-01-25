//
//  DeleteButton.swift
//  landmarks (iOS)
//
//  Created by Maijuriina Mustonen on 18/01/2021.
//

import SwiftUI

struct DeleteButton: View {
    //@Binding var isDeleted: Bool
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Image(systemName: "trash")
                .foregroundColor(.red)
        }
         .alert(isPresented: $showingAlert) {
            Alert(title: Text("Delete landmark"), message: Text("Are you sure?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Delete")))
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton()
    }
}
