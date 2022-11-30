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

        VStack{

            ForEach(model.params, id: \.self) { data in
                HStack{

                    KeyValueView(key: data, value: "Sample", advance: nil)
                }
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
    }

    // 2.
    private func onDelete(offsets: IndexSet) {
        model.params.remove(atOffsets: offsets)
    }

    // 3.
    private func onMove(source: IndexSet, destination: Int) {
        model.params.move(fromOffsets: source, toOffset: destination)
    }
}

struct KeyValueColloctions_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueColloctions()
    }
}
