//
//  Flat_EarthTests.swift
//  Flat EarthTests
//
//  Created by Javad Mammadbayli on 10/16/22.
//

import XCTest
@testable import Flat_Earth

final class Flat_EarthTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunchesSuccess() {
        //Given
        let request = Request.shared
        var data: Data?
        var error: Request.RequestError?
        
        //When
        let expectation = expectation(description: "Launches")
        
        //Then
        request.getLaunches { _data, _error in
            data = _data
            error = _error

            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
        
        XCTAssertNil(error)
        XCTAssertNotNil(data)
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
