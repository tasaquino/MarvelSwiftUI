//
//  MarvelSwiftUITests.swift
//  MarvelSwiftUITests
//
//  Created by Thais Aquino on 19/10/2023.
//

import XCTest
import Alamofire
@testable import MarvelSwiftUI

final class MarvelRepositoryTest: XCTestCase {

    func test_fetchComics_success() async throws {
        let appConfig = AppConfig()
        let sut = ComicsRepository(appConfig: appConfig)
        let response = try await sut.fetchComics()
        
        XCTAssert(response?.code == 200)
        XCTAssert(response?.data != nil)
        XCTAssert(response!.data!.count > 0)
        XCTAssert(response!.data!.results!.count > 0)
        XCTAssert(response!.data!.results!.first?.id != nil)
    }
    
    func test_fetchComics_invalidUrl_fail() async throws {
        let appConfig = MockAppConfig(url: "msmarvel", apiKey: "boom", hash: "boom")
        let sut = ComicsRepository(appConfig: appConfig)
        do {
            try await sut.fetchComics()
        } catch {
            XCTAssert(error.asAFError?.isSessionTaskError == true)
        }
    }
    
    func test_fetchComics_wrongApiKey_fail() async throws {
        let appConfig = MockAppConfig(url: "https://gateway.marvel.com", apiKey: "boom", hash: "boom")
        let sut = ComicsRepository(appConfig: appConfig)
        do {
            try await sut.fetchComics()
        } catch {
            XCTAssert(error.asAFError?.responseCode == 401)
        }
    }
}

struct MockAppConfig: AppConfigProtocol {
    var apiKey: String = "boomm"
    var hash: String = "boomm"
    var baseUrl: String = "boomm"
    
    init(url: String, apiKey: String, hash: String) {
        self.baseUrl = url
        self.apiKey = apiKey
        self.hash = hash
    }
    
    func getComicsUrl() -> String {
        return "\(baseUrl)/v1/public/comics?apikey=\(apiKey)&hash=\(hash)&ts=1"
    }
    
    func getCharacterUrlBy(characterId: String) -> String {
        return ""
    }
}
