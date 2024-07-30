//
//  APIServiceTests.swift
//  PopularArticlesTests
//
//  Created by nargis hameed on 29/07/2024.
//


import XCTest
@testable import PopularArticles

class APIServiceTests: XCTestCase {
    
    var sut: MockService?
    
    override func setUp() {
        super.setUp()
        sut = MockService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_Articles() {
        
        let sut = self.sut!
        sut.completeArticleList = [Article.withMockData()!]
        
        sut.fetchArticleList(periods: .Week, completion: {(success, result, err)  in
            for article in result {
                XCTAssertNotNil(article)
            }
            
        })
        
        
    }
    
}
