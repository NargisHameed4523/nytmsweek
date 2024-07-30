//
//  MockService.swift
//  PopularArticlesTests
//
//  Created by nargis hameed on 29/07/2024.
//

import Foundation
@testable import PopularArticles

class MockService : APIServiceProtocol {
    
    var isFetchCalled = false

    var completeArticleList: [Article] = [Article]()
    var completionHandler: ((Bool, [Article], Error?) -> ())!
    
    
    func fetchArticleList(periods: PopularArticles.Periods, completion: @escaping (Bool, [Article], Error?) -> (Void)) {
        isFetchCalled = true
        completionHandler = completion
        
    }

    func fetchSuccess() {
        completionHandler( true, completeArticleList, nil )
    }
    
    func fetchFail(error: Error?) {
        completionHandler( false, completeArticleList, error )
    }
}
