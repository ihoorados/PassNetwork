//
//  SingleRequestViewModel.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 29/11/2022.
//

import Foundation
import NetworkPlugins
import Combine

// MARK: UI State Control
enum SingleRequestModelState {

    case Live
    case Loading
    case Succsess(data: Data?, response: URLResponse?)
    case Failure(error: String)
}

protocol SingleRequest: ObservableObject {

    var endPoint: NetworkEndPoint { get set }
    var response: URLResponse? { get set }
    var data: Data? { get set }
    var error: Error? { get set }
    var currentState: SingleRequestModelState { get set }

    func request()
}

final class SingleRequestModel: NSObject, ObservableObject, SingleRequest {

    init(endpoint: NetworkEndPoint = PublicAPI()) {

        self.endPoint = endpoint
    }

    // MARK: Shared instance
    static let shared = SingleRequestModel()

    // MARK: Private Properties
    private let repo = MainRepository()
    private var cancelables = Set<AnyCancellable>()

    // MARK: Public Properties
    @Published var endPoint: NetworkEndPoint
    @Published var response: URLResponse? = nil
    @Published var data: Data? = nil
    @Published var error: Error? = nil
    @Published var currentState: SingleRequestModelState = .Live

    // MARK: Public Functions
    func request(){

        print("▶️ Execution Start")
        self.currentState = .Loading
        repo.fetchRequest(endPint: endPoint)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("⏹️ Execution Finihsed.")
                case .failure(let error):
                    self.currentState = .Failure(error: error.localizedDescription)
                }
            } receiveValue: { (data,response) in

                self.currentState = .Succsess(data: data, response: response)
                self.response = response
                self.data = data
            }.store(in: &cancelables)
    }
}
