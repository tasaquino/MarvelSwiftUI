//
//  NetworkingManager.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation
import Alamofire

protocol NetworkingManagerProtocol {
    func fetch<T:Decodable>(url: String) async throws -> T
}

struct NetworkingManager: NetworkingManagerProtocol {
    func fetch<T:Decodable>(url: String) async throws -> T {
        let response: DataResponse<T, AFError> = await AF.request(url, interceptor: .retryPolicy)
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
