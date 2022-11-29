//
//  ResponseView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 26/11/2022.
//

import SwiftUI

struct ResponseView: View {

    @ObservedObject private var model = SingleRequestModel.shared

    var body: some View {

        VStack {

            HStack{
                Spacer()
                Text(model.data?.description ?? "")
                    .foregroundColor(.green)
            }.padding()
            Spacer()
            ScrollView(){
                
                Text(model.response?.description ?? "").padding()
            }
            Spacer()
        }

    }
}

struct ResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseView()
    }
}
