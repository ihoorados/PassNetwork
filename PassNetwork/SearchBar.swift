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
            .frame(width: 60.0,height: 44.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)

            TextField("Enter request URL", text: $username)
            .frame(height: 44.0)
            .disableAutocorrection(true)
            .border(.gray)
            .cornerRadius(8.0)

            Button("Send") {

            }
            .frame(width: 88.0,height: 44.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)

        }
        .frame(height: 44.0)
        //.background(Color.red)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
