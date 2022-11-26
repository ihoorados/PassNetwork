//
//  KeyValueColloctions.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct KeyValueColloctions: View {

    var body: some View {

        GroupBox() {
            KeyValueToolbarView()
            KeyValueView()
        }
    }
}

struct KeyValueColloctions_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueColloctions()
    }
}
