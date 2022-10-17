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
    
    func testApiRequestSuccess() {
       let _ = XCTSkip("Same as below")
    }
    
    func testLaunchesRequestSuccess() {
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
    
    func testLaunchesParseSuccess() {
        //Given
        var launches: [Launch]?
        var error: Parser.ParserError?
        let expectation = expectation(description: "Parser")
        
        //When
        Parser.shared.getLaunches { _launches, _error in
            launches = _launches
            error = _error
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
        
        //Then
        XCTAssertNil(error)
        XCTAssertNotNil(launches)
    }
    
}
