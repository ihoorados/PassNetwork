//
//  Response.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 1/12/2022.
//

import Foundation

struct Response: Equatable {

    var request: URLRequest?
    var response: URLResponse?
    var data: Data?
}
