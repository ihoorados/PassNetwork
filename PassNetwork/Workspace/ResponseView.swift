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

        if case .Loading = model.currentState {

            VStack{
                Text("Loading")
            }
        } else if case .Succsess(let data,let response) = model.currentState {

            if let response = response as? HTTPURLResponse{

                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "globe")
                            .foregroundColor(.green)
                        Text(response.statusCode.description)
                            .foregroundColor(.green)

                    }.padding()
                    ScrollView(){
                        Text(data?.description ?? response.description)
                            .padding()
                    }
                }
            }else{
                VStack {
                    Spacer()
                    ScrollView(){
                        Text(response?.description ?? "").padding()
                    }
                    Spacer()
                }
            }
        } else if case .Failure(let error) = model.currentState {
            VStack(alignment: .center) {
                Spacer()
                Text(error)
                    .font(.headline.bold())
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
        } else if case .Live = model.currentState{

            VStack {

                Image(systemName: "dot.circle.and.hand.point.up.left.fill")
                    .padding()
                Text("Hit Send to get a response")
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

struct ResponseView_Previews: PreviewProvider {
    static var previews: some View {
        ResponseView()
    }
}
