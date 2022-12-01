//
//  ContentView.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 25/11/2022.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {

    @ObservedObject var viewStore: ViewStore<AppState, AppAction>

    @State private var urlTextFeild: String = ""
    @State private var keyFeild: String = ""
    @State private var valueFeild: String = ""

    var body: some View {

        NavigationView {
            List{
                ForEach(viewStore.collections.endpoints, id: \.id) { endPoint in
                    NavigationLink(destination: Workspace(endpoint: endPoint)) {
                        Label(endPoint.url.description, systemImage: "folder")
                    }
                }
            }
        }
    }
}

extension ContentView{

    func Workspace(endpoint: EndPoint) -> some View {
      return VStack{

          Text("Pass Network 2022")
              .foregroundColor(.gray)
              .font(.footnote)
          SearchBar(endpoint: endpoint)
          KeyValueCollections()

          Spacer()

          switch viewStore.currentState{
          case .Loading:
            VStack{
                  Text("Loading")
                  }
          case .Succsess(let data,let response):
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

                          Text(response.url?.dataRepresentation.description ?? "")
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

          case .Failure(let error):

               VStack(alignment: .center) {
                  Spacer()
                  Text(error)
                      .font(.headline.bold())
                      .multilineTextAlignment(.center)
                  Spacer()
              }
              .padding()

          case .Live:
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

    func SearchBar(endpoint: EndPoint) -> some View{

        return  HStack() {

            Menu(endpoint.method.rawValue) {

                Button("GET"){
                    viewStore.send(.setMethod(.get))
                }
                Button("POST"){
                    viewStore.send(.setMethod(.post))
                }
                Button("PUT"){
                    viewStore.send(.setMethod(.put))
                }
            }
            .frame(width: 66.0,height: 34.0)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)

            TextField("Enter request URL", text: $urlTextFeild)
                .onAppear(perform: {
                    self.urlTextFeild = endpoint.url.description
                })
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .frame(height: 44.0)

            Button("Send") {

                self.viewStore.send(.request)
            }
            .frame(width: 64.0,height: 34.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8.0)
            .font(.headline)
        }
        .frame(height: 44.0)
    }

    func KeyValueCollections() -> some View{

        return VStack{

            DisclosureGroup("Parameters") {
                ForEach((viewStore.endpoint.parameters.keys.reversed()), id: \.self) { data in
                    HStack{

                        KeyValueCell(key: data, value: "Sample")
                    }
                }
            }.foregroundColor(.primary)

            DisclosureGroup("Headers") {

                ForEach((viewStore.endpoint.headers.keys.reversed()), id: \.self) { data in
                    HStack{

                        KeyValueCell(key: data, value: "Sample")
                    }
                }
            }.foregroundColor(.primary)
        }
    }


    func KeyValueCell(key: String, value: String) -> some View{

        return VStack{

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

//    func ResponseView() -> some View{
//
//
//    }

}
