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

            Spacer()
            ResponseView()
                .frame(height: 200)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12.0)
            KeyValueColloctions()
            SearchBar()
            Text("Pass Network 2022")
                .foregroundColor(.gray)
                .font(.footnote)

        }
    }
}

struct Workspace_Previews: PreviewProvider {
    
    static var previews: some View {
        Workspace()
    }
}
