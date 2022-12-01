//
//  AppReducer.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 1/12/2022.
//

import Foundation
import ComposableArchitecture

extension AnyReducer where State == AppState, Action == AppAction, Environment == Void {

    static var singleRequestReducer = AnyReducer { (state: inout AppState, action: AppAction, _: Void) in
    switch action {
    case .request:
        state.currentState = .Loading
        return .none
    case .setMethod(let method):
        state.endpoint.method = method
      return .none
    }
  }
}
