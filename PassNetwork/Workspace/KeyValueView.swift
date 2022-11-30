//
//  KeyValueView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct KeyValueView: View {

    let key: String
    let value: String
    let advance: (() -> Void)?

    @State private var keyFeild: String = ""
    @State private var valueFeild: String = ""
    @State private var toggle: Bool = true

    var body: some View {

        VStack{

            HStack{

                TextField("Enter Key", text: $keyFeild)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)

                TextField("Enter Value", text: $valueFeild)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            }.onAppear(){

                self.keyFeild = key
                self.valueFeild = value
            }
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {

        KeyValueView(key: "Test Key", value: "Test Value", advance: nil)
    }
}
