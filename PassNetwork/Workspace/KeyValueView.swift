//
//  KeyValueView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct KeyValueView: View {

    @State private var key: String = ""
    @State private var value: String = ""
    @State private var toggle: Bool = true

    var body: some View {

        VStack{

            HStack{

//                Toggle(isOn: $toggle) {
//                }.labelsHidden()
//
//                Spacer()

                TextField("Enter Key", text: $key)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)

                TextField("Enter Value", text: $value)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            }
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView()
    }
}
