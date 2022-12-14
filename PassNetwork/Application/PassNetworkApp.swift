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
        initialState: AppState(collections: mockCollections(), endpoint: EndPoint(path: "", host: "", scheme: "", url: URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0")!, method: .get, headers: [:], parameters: [:])),
      reducer: AnyReducer.singleRequestReducer,
      environment: ()
    )

    var body: some Scene {
        WindowGroup {
            ContentView(viewStore: ViewStore(store))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }


    static func mockCollections() -> Collections{

        let end1 = EndPoint(path: "", host: "", scheme: "",
                            url: URL(string: "https://www.1timer.info/")!,
                            method: .get, headers: [:],
                            parameters: ["sample param key":"s p v"])

        let end2 = EndPoint(path: "", host: "", scheme: "",
                            url: URL(string: "https://www.2timer.info/")!,
                            method: .get, headers: ["header key":"header value", "":""],
                            parameters: [:])

        return Collections(endpoints: [end1,end2])
    }
}
