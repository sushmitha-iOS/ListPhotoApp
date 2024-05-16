//
//  MockTestListAPI.swift
//  ListAppTests
//
//  Created by Sushmitha Rani on 16/05/24.
//

import Foundation
// Mock URLSession for testing network requests
class MockTestListAPI: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        let data = loadStub(name: "Albums")
        completionHandler(data, nil, nil)
        return MockURLSessionDataTask()
    }
}
