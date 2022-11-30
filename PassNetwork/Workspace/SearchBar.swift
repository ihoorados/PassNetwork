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

            Menu(model.endPoint.method.rawValue) {
                Button("GET"){
                    model.endPoint.method = .get
                }
                Button("POST"){
                    model.endPoint.method = .post
                }
                Button("PUT"){
                    model.endPoint.method = .put
                }
            }
            .frame(width: 66.0,height: 34.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)

            TextField("Enter request URL", text: $requestUrl)
                .onAppear(perform: {
                    self.requestUrl = model.endPoint.url.description
                })
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .frame(height: 44.0)

            Button("Send") {

                self.model.request()
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
