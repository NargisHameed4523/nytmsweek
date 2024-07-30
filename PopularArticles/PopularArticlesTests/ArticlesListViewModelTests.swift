//
//  ArticlesListViewModelTests.swift
//  PopularArticlesTests
//
//  Created by nargis hameed on 29/07/2024.
//



import XCTest
@testable import PopularArticles

class ArticlesListViewModelTests: XCTestCase {
    var sut: ArticlesListViewModel!
    var mockAPIService: MockService!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockAPIService = MockService()
        sut = ArticlesListViewModel(apiService: mockAPIService)
    }
    
   
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    
  
    
    
    func test_fetch_articles() {
        // Given
        mockAPIService.completeArticleList = [Article]()
        
        // When
        sut.initFetch()
        
        // Assert
        XCTAssert(mockAPIService!.isFetchCalled)
        
    }
    
    func test_fetch_fail() {
        
        // When
        sut.initFetch()

        //Replace the nil with error instace
        mockAPIService.fetchFail(error: nil )

        // Sut should display predefined error message
        XCTAssertEqual( sut.alertMessage, nil)
        
    }
   
    
    func test_get_cell_view_model() {
        
        //Given a sut with fetched articles
        goToFetchArticlesFinished()
        
        let indexPath = IndexPath(row: 0, section: 0)
        let testArticle = mockAPIService.completeArticleList[indexPath.row]
        
        // When
        let vm = sut.getCellViewModel(at: indexPath)
        
        //Assert
        XCTAssertEqual( vm.titleText, testArticle.title)
        XCTAssertEqual( vm.authorText, testArticle.byline)

    }
   
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


//MARK: State control
extension ArticlesListViewModelTests {
    private func goToFetchArticlesFinished() {
        mockAPIService.completeArticleList =  [Article.withMockData()!]
        sut.initFetch()
        mockAPIService.fetchSuccess()
    }
}


