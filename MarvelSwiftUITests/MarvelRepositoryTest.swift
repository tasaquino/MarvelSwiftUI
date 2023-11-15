//
//  MarvelSwiftUITests.swift
//  MarvelSwiftUITests
//
//  Created by Thais Aquino on 19/10/2023.
//

import XCTest
import Alamofire
import Mocker
@testable import MarvelSwiftUI

final class MarvelRepositoryTest: XCTestCase {

    func test_fetchComics_success() async throws {
        let appConfig = AppConfig()
        let networking = MockNetworkingManager()
        
        let originalUrl = appConfig.getComicsUrl()
        
        // setup Mocker
        let mock = Mock(url: URL(string: originalUrl)!, dataType: .json, statusCode: 200, data: [
            .get: try! Data(contentsOf: MockedData.comicsData)])
        mock.register()
        
        // setup SUT
        let sut = ComicsRepository( networking: networking, appConfig: appConfig)
        let response = try await sut.fetchComics()
        
        XCTAssert(response?.code == 200)
        XCTAssert(response?.data != nil)
        XCTAssert(response!.data!.count > 0)
        XCTAssert(response!.data!.results!.count > 0)
        XCTAssert(response!.data!.results!.first?.id != nil)
    }
    
    func test_fetchComics_invalidUrl_fail() async throws {
        let appConfig = MockAppConfig(url: "msmarvel", apiKey: "boom", hash: "boom")
        let networking = MockNetworkingManager()
        let sut = ComicsRepository(networking: networking, appConfig: appConfig)
        do {
            try await sut.fetchComics()
        } catch {
            XCTAssert(error.asAFError?.isSessionTaskError == true)
        }
    }
    
    func test_fetchComics_wrongApiKey_fail() async throws {
        let appConfig = MockAppConfig(url: "https://gateway.marvel.com", apiKey: "boom", hash: "boom")
        let networking = MockNetworkingManager()
        let sut = ComicsRepository(networking: networking, appConfig: appConfig)
        do {
            try await sut.fetchComics()
        } catch {
            XCTAssert(error.asAFError?.responseCode == 401)
        }
    }
}
