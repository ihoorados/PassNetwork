//
//  ResponseView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct ResponseView: View {
    var body: some View {

        VStack {

            HStack{
                Spacer()
                Text("Status Code")
                    .foregroundColor(.green)
            }.padding()

            Spacer()
            Text("Response")
            Spacer()
        }

    }
}

struct ResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseView()
    }
}
