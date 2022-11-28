//
//  Workspace.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 25/11/2022.
//

import SwiftUI

struct Workspace: View {

    var body: some View {

        VStack(alignment:.center,spacing: 12){

            Text("Pass Network 2022")
                .foregroundColor(.gray)
                .font(.footnote)
            SearchBar()
            KeyValueColloctions()
            ResponseView()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12.0)
            Spacer()
        }
    }
}

struct Workspace_Previews: PreviewProvider {
    
    static var previews: some View {
        Workspace()
    }
}
