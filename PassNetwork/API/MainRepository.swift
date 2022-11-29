//
//  MainRepository.swift
//  PassNetwork
//
//  Created by Hoorad Ramezani on 28/11/2022.
//

import Foundation
import NetworkPlugins
import Combine

class MainRepository{

    private let service: CoreService
    init(service: CoreService = URLSessionDataTaskService()){

        self.service = service
    }

    func fetchRequest(endPint: NetworkEndPoint) -> AnyPublisher<(Data?, URLResponse?), Error> {

        return Future { promise in

            self.service.request(endPoint: endPint) { result in

                switch result{
                case .failure(let error):
                    print("❌ \(error)")
                    return promise(.failure(error))
                case .success((let data, let response)):
                    print("✅ \(data)")
                    print("🌐 \(response)")
                    return promise(.success((data,response)))
                }
            }
        }.eraseToAnyPublisher()
    }
}
