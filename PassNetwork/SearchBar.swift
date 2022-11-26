//
//  SearchBar.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct SearchBar: View {

    @State private var username: String = ""

    var body: some View {

        HStack() {

            Menu("GET") {
                Text("GET")
                Text("POST")
                Text("PUT")
            }
            .frame(width: 60.0,height: 34.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)

            TextField("Enter request URL", text: $username)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .frame(height: 44.0)

            Button("Send") {

            }
            .frame(width: 64.0,height: 34.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)
        }
        .frame(height: 44.0)
        .padding()
        //.background(Color.red)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
