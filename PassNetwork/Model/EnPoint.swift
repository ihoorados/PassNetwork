//
//  EnPoint.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 1/12/2022.
//

import Foundation
import NetworkPlugins

struct EndPoint: Equatable{

    var path: String
    var host: String
    var scheme: String
    var url: URL
    var method: Method
    var headers: [String: String] = [:]
    var parameters: [String: String] = [:]
}

public enum Method: String, Equatable {

    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}
