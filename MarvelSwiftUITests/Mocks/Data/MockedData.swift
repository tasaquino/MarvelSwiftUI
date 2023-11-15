//
//  MockedData.swift
//  MarvelSwiftUITests
//
//  Created by Thais Aquino on 15/11/2023.
//

import Foundation
@testable import MarvelSwiftUI

class MockedData {
    public static let comicsData: URL = Bundle(for: MockedData.self).url(forResource: "comics_data_example", withExtension: ".json")!
}
