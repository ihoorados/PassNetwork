//
//  SingleRequestViewModel.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 29/11/2022.
//

import Foundation
import Combine

final class SingleRequestModel: NSObject, ObservableObject {

    enum SingleRequestModelState {
        case LOADING
        case SUCCESS(response: URLResponse?)
        case FAILURE(error: String)
    }

    private let repo = MainRepository()
    private var cancelables = Set<AnyCancellable>()

    static let shared = SingleRequestModel()

    @Published var response: URLResponse? = nil
    @Published var data: Data? = nil
    @Published var error: Error? = nil
    @Published var currentState: SingleRequestModelState = .LOADING


    func start(){

        print("▶️ Execution Start")
        self.currentState = .LOADING
        repo.fetchRequest(endPint: PublicAPI())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("⏹️ Execution Finihsed.")
                case .failure(let error):
                    self.currentState = .FAILURE(error: error.localizedDescription)
                }
            } receiveValue: { (data,response) in

                self.currentState = .SUCCESS(response: response)
                self.response = response
                self.data = data
            }.store(in: &cancelables)
    }
}
