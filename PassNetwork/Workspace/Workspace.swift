//
//  Workspace.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 25/11/2022.
//

import SwiftUI

struct Workspace: View {

    @ObservedObject private var model = SingleRequestModel.shared

    var body: some View {

        VStack{

            Text("Pass Network 2022")
                .foregroundColor(.gray)
                .font(.footnote)
            SearchBar()
            GroupBox(label:
                Label("Parameters", systemImage: "building.columns")
            ) {

                KeyValueColloctions()
            }
            GroupBox(label:
                Label("Parameters", systemImage: "building.columns")
            ) {

                KeyValueColloctions()
            }
            ResponseView()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12.0)

            Spacer()
        }

//        if case .LOADING = model.currentState {
//
//
//        } else if case .SUCCESS(let response) = model.currentState {
//
//
//        } else if case .FAILURE(let error) = model.currentState {
//            VStack(alignment: .center) {
//                Spacer()
//                Text(error)
//                    .font(.headline.bold())
//                    .multilineTextAlignment(.center)
//                Spacer()
//            }
//            .padding()
//        }
        
//        VStack(alignment:.center,spacing: 12){
//
//            Text("Pass Network 2022")
//                .foregroundColor(.gray)
//                .font(.footnote)
//            if case .LODAING
//            SearchBar()
//            KeyValueColloctions()
//            ResponseView()
//                .background(Color(UIColor.secondarySystemBackground))
//                .cornerRadius(12.0)
//            Spacer()
//        }

    }
}

struct Workspace_Previews: PreviewProvider {
    
    static var previews: some View {
        Workspace()
    }
}
