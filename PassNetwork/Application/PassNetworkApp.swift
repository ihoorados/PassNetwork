//
//  PassNetworkApp.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 25/11/2022.
//

import SwiftUI
import ComposableArchitecture

@available(iOS 14.0, *)
@main
struct PassNetworkApp: App {

    
    let persistenceController = PersistenceController.shared
    let store: Store<AppState, AppAction> = .init(
        initialState: AppState(endpoint: EndPoint(path: "", host: "", scheme: "",
                                                  url: URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0")!,
                                                  method: .get, headers: [:], parameters: [:])),
      reducer: AnyReducer.singleRequestReducer,
      environment: ()
    )

    var body: some Scene {
        WindowGroup {
            ContentView(viewStore: ViewStore(store))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
