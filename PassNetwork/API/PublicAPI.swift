//
//  PublicAPI.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation
import NetworkPlugins

struct PublicAPI: NetworkEndPoint {

    /* ------------------------------- */
    // MARK: Dependency Injection
    /* ------------------------------- */

    init() {

        let headers: HttpHeaders = [:]
        self.headers = headers
        self.url = URL(string: "https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0")!
        self.host = ""
        self.path = ""
        self.scheme = ""
    }

    /* ------------------------------- */
    // MARK: Properties
    /* ------------------------------- */

    var path: String
    var host: String
    var scheme: String
    var url: URL
    var method: HttpMethod = .get
    var parameters: HttpParameters = [:]
    var headers: HttpHeaders = [:]
}
