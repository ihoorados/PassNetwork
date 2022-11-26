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

    var body: some View {

        List{

            HStack{
                Text("Key")
                Spacer()
                Text("Value")
                Spacer()
            }

            HStack{

                TextField("Enter Key", text: $key)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .frame(height: 44.0)

                TextField("Enter Value", text: $value)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .frame(height: 44.0)
            }
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView()
    }
}
