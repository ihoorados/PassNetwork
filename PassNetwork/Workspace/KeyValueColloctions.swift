//
//  KeyValueColloctions.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct KeyValueColloctions: View {

    @ObservedObject private var model = SingleRequestModel.shared

    var body: some View {

        ScrollView{
            
            GroupBox(label:
                Label("Parameters", systemImage: "building.columns")
            ) {

                KeyValueView()
                KeyValueView()
            }

            GroupBox(label:
                Label("Headers", systemImage: "building.columns")
            ) {

                KeyValueView()
                KeyValueView()
            }

            ResponseView()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12.0)
        }
    }
}

struct KeyValueColloctions_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueColloctions()
    }
}
