//
//  MockNetworkingManager.swift
//  MarvelSwiftUITests
//
//  Created by Thais Aquino on 15/11/2023.
//

import Foundation
import Alamofire
import Mocker
@testable import MarvelSwiftUI

struct MockNetworkingManager: NetworkingManagerProtocol {
    func fetch<T:Decodable>(url: String) async throws -> T {
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        let sessionManager = Alamofire.Session(configuration: configuration)

        let response: DataResponse<T, AFError> = await sessionManager.request(url, interceptor: .retryPolicy)
                               .cacheResponse(using: .cache)
                               .validate()
                               .cURLDescription { description in
                                   debugPrint(description)
                               }
                               .serializingDecodable(T.self)
                               .response
        
        do {
            let response = try response.result.get()
            debugPrint(response)
            return response
        } catch {
            throw error
        }
    }
}
