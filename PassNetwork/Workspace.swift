//
//  Workspace.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 25/11/2022.
//

import SwiftUI

struct Workspace: View {
    var body: some View {
        VStack{

            Spacer()
            SearchBar()
        }.padding()
    }
}

struct Workspace_Previews: PreviewProvider {
    
    static var previews: some View {
        Workspace()
    }
}
