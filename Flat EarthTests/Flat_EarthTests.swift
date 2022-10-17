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
        var error: ParserProviderError?
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
    
    func testImageDownloaderSuccessWhenNotPresentInCache() {
        //Given
        let imageURL = URL(string: "https://images2.imgbox.com/be/e7/iNqsqVYM_o.png")!
        let downloader = ImageDownloader.shared
        let expectation = expectation(description: "ImageDownloader")
        var image: UIImage?
        var error: Error?
        
        //When
        downloader.downloadImageFrom(url: imageURL) { _image, _error in
            image = _image
            error = _error
            
            expectation.fulfill()
        }
        
        //Then
        wait(for: [expectation], timeout: 20)
        
        //Then
        XCTAssertNil(error)
        XCTAssertNotNil(image)
    }
    
    func testImageDownloaderSuccessWhenPresentInCache() {
        //Given
        let imageURL = URL(string: "https://images2.imgbox.com/be/e7/iNqsqVYM_o.png")!
        let downloader = ImageDownloader.shared
        let expectation = expectation(description: "ImageDownloader")
        var image: UIImage?
        var error: Error?
        
        //When
        downloader.downloadImageFrom(url: imageURL) {_image, _error in
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20)
        
        let secondExpectation = self.expectation(description: "ImageDownloader2")
        downloader.downloadImageFrom(url: imageURL) {_image, _error in
            image = _image
            error = _error
            
            secondExpectation.fulfill()
        }
        
        wait(for: [secondExpectation], timeout: 0.5)
        
        //Then
        XCTAssertNil(error)
        XCTAssertNotNil(image)
    }
    
    func testMultipleCallbacks() {
        //Given
        let imageURL = URL(string: "https://images2.imgbox.com/be/e7/iNqsqVYM_o.png")!
        let downloader = ImageDownloader.shared
        
        let expectation1 = expectation(description: "ImageDownloader1")
        let expectation2 = expectation(description: "ImageDownloader2")
        
        var callback1 = {(image: UIImage?, error: Error?) -> Void in
            expectation1.fulfill()
        }
        
        var callback2 = {(image: UIImage?, error: Error?) -> Void in
            expectation2.fulfill()
        }
        
        //When
        downloader.downloadImageFrom(url: imageURL, completion: callback1)
        downloader.downloadImageFrom(url: imageURL, completion: callback2)
        
        wait(for: [expectation1, expectation2], timeout: 20)
        
        
        //Then
        XCTAssertTrue(true)
    }
    
}
