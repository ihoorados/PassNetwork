//
//  KeyValueToolbarView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct KeyValueToolbarView: View {
    var body: some View {

        HStack{

            Spacer()
            Menu("Params") {
                Text("Params")
                Text("Header")
                Text("Body")
            }
            .frame(width: 80.0)
            .frame(height: 34.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)
        }
    }
}

struct KeyValueToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueToolbarView()
    }
}
