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
enum SingleRequestState: Equatable {

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
    var currentState: SingleRequestState { get set }

    func request()
}

final class SingleRequestEngine: NSObject, ObservableObject, SingleRequest {

    init(endpoint: NetworkEndPoint = PublicAPI()) {
        self.endPoint = endpoint
        super.init()
        self.params = self.getKeysParam()
        self.headers = self.getKeysHeader()
    }

    // MARK: Shared instance
    static let shared = SingleRequestEngine()

    // MARK: Private Properties
    private let repo = MainRepository()
    private var cancelables = Set<AnyCancellable>()

    // MARK: Public Properties
    @Published var endPoint: NetworkEndPoint
    @Published var response: URLResponse? = nil
    @Published var data: Data? = nil
    @Published var error: Error? = nil
    @Published var currentState: SingleRequestState = .Live

    @Published var params: [String] = []
    @Published var headers: [String] = []
    @Published var result: [String:Any] = [:]

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

                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                    self.result = json ?? [:]
                } catch {
                    print("errorMsg")
                }
            }.store(in: &cancelables)
    }


    func addHeader(key: String, value: Any){

    }

    func removeHeader(key: String, value: Any){

    }

    func addParam(key: String, value: Any){

    }

    func removeParam(key: String, value: Any){

    }

    func getKeysParam() -> [String]{

        var keys: [String] = []
        endPoint.parameters?.keys.forEach({ key in
            keys.append(key)
        })
        return keys
    }

    func getKeysHeader() -> [String]{

        var keys: [String] = []
        endPoint.headers?.keys.forEach({ key in
            keys.append(key)
        })
        return keys
    }

    // Model To Json (Dictionary)
    func modelToJson<T: Codable>(model: T) -> [String: Any]?{

        do {

            var json: [String: Any]? = [:]
            let jsonEncoder: JSONEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(model)
            json = (try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any])
            return json
        } catch{

            return nil
        }
    }
}
