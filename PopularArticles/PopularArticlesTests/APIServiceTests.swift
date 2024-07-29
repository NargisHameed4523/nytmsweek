//
//  APIServiceTests.swift
//  PopularArticlesTests
//
//  Created by nargis hameed on 29/07/2024.
//


import XCTest
@testable import PopularArticles

class APIServiceTests: XCTestCase {
    
    var sut: NetworkService?
    
    override func setUp() {
        super.setUp()
        sut = NetworkService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_top_stories() {
        
        // Given A apiservice
        let sut = self.sut!
        
        // When fetch top stories
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchArticleList(periods: .Week, completion: {(success, result, err)  in
            expect.fulfill()
            for article in result {
                XCTAssertNotNil(article)
            }
            
        })
        
        wait(for: [expect], timeout: 3.1)
    }
    
}
