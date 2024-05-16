//
//  ListAppTests.swift
//  ListAppTests
//
//  Created by Sushmitha Rani on 16/05/24.
//

import XCTest
@testable import ListApp

final class ListAppTests: XCTestCase {


        // Load stub data from a JSON file
        func loadStub(name: String) -> Data? {
            let bundle = Bundle(for: type(of: self))
            let url = bundle.url(forResource: name, withExtension: "json")!
            return try? Data(contentsOf: url)
        }
        
        // Test networking code
        func testFetchRemoteData() {
            let viewModel = Album()
            viewModel.fetchRemoteData()
            XCTAssertEqual(viewModel.albums.count, 3) // Assuming there are 3 albums in the stub data
        }
        
        // Test decoding
        func testDecoding() {
            let data = loadStub(name: "Albums")
            XCTAssertNotNil(data)
            
            do {
                let albums = try JSONDecoder().decode([Album].self, from: data!)
                XCTAssertEqual(albums.count, 3) // Assuming there are 3 albums in the stub data
            } catch {
                XCTFail("Decoding failed with error: \(error)")
            }
        }
        
        // Test SwiftUI view
        func testContentView() {
            let contentView = ContentView()
            let albums: [Album] = [Album(albumId: 1, id: 1, title: "Title 1", url: "http://example.com/image1.jpg", thumbnailUrl: "http://example.com/thumb1.jpg")]
            
            // Set albums to the view
            contentView.albums = albums
            
            // Trigger the view's body
            let view = contentView.body
            
            // Assert that the view displays the album correctly
            // You may need to adjust this based on your actual view implementation
            XCTAssertNotNil(view)
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
