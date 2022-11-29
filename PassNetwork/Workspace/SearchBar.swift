//
//  SearchBar.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct SearchBar: View {

    @State private var requestUrl: String = ""
    @ObservedObject private var model = SingleRequestModel.shared

    var body: some View {

        HStack() {

            Menu("GET") {
                Button("GET"){
                    print("GET Selected")
                }
                Button("POST"){
                    print("POST Selected")
                }
                Button("PUT"){
                    print("PUT Selected")
                }
            }
            .frame(width: 60.0,height: 34.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)

            TextField("Enter request URL", text: $requestUrl)
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .frame(height: 44.0)

            Button("Send") {

                
                self.requestUrl = PublicAPI.init().url.description
                self.model.start()
            }
            .frame(width: 64.0,height: 34.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)
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
