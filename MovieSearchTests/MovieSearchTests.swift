//
//  MovieSearchTests.swift
//  MovieSearchTests
//
//  Created by Mehmet Ozkan on 25.01.2024.
//

import XCTest
@testable import MovieSearch

final class MovieSearchTests: XCTestCase {
    
    private let client = APIClient.shared

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetMoviesAndCheck() async throws {
        // Given
        let search = "Dark"
        let request = MoviesRequest(search: search)
        
        // When
        do {
            let response = try await client.send(request)
            
            // Then
            XCTAssertEqual(response.movies.isEmpty, false)
        } catch {
            XCTFail("service error \(error)")
        }
    }
    
    func testGetMovieDetailAndCheck() async throws {
        // Given
        let imbdId = "tt0468569"
        let request = MovieDetailsRequest(imbdId: imbdId)
        
        // When
        do {
            let response = try await client.send(request)
            
            // Then
            XCTAssertEqual(response.imdbId.isEmpty, false)
        } catch {
            XCTFail("service error \(error)")
        }
    }

}
