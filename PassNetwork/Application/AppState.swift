//
//  AppState.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 1/12/2022.
//

import Foundation


struct AppState: Equatable {

  var endpoint: EndPoint
  var response: Response?
  var currentState: SingleRequestState = .Live
}
