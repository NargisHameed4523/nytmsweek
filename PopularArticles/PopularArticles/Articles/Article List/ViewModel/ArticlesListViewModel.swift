//
//  ArticlesListViewModel.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//



import Foundation
import UIKit

class ArticlesListViewModel {
    
    private let apiService: APIServiceProtocol
    var articleList : Articles?
    private var period = Periods.Week
    
    
    private var cellViewModels: [PopularAticlesRowVwModel] = [PopularAticlesRowVwModel]() {
        didSet {
            self.reloadTableVwHandler?()
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertHandler?()
        }
    }
    
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    
    var selectedArticle: ArticleDetailsViewModel?
    
    var reloadTableVwHandler: (()->())?
    var showAlertHandler: (()->())?
    var updateLoadingStatus: (()->())?
    
    init( apiService: APIServiceProtocol = NetworkService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        self.isLoading = true
        apiService.fetchArticleList(periods: period, completion: { [weak self] (success, results, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.localizedDescription
            } else {
                
                debugPrint(results);
                
                self?.displayArticles(list: results)
            }
        })
        
        
        
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> PopularAticlesRowVwModel {
        return cellViewModels[indexPath.row]
    }
    
    func createCellViewModel( article: Article ) -> PopularAticlesRowVwModel {
        
        let imageUrl =  article.media?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.first?.url:"":""
        
        return PopularAticlesRowVwModel(titleText: article.title ?? "", authorText: article.byline ?? "", imageUrl: imageUrl ?? "", dateTime: article.published_date ?? "")
    }
    
    private func displayArticles( list: Articles ) {
        self.articleList = list
        var vms = [PopularAticlesRowVwModel]()
        for article in list {
            vms.append( createCellViewModel(article: article) )
        }
        self.cellViewModels = vms
    }
    
}

extension ArticlesListViewModel {
    func showArticleDetails( at indexPath: IndexPath ){
        let currentArticle = self.articleList?[indexPath.row]

        let detailImage = currentArticle?.media?.count ?? 0 > 0 ? currentArticle?.media?.first?.media_metadata?.count ?? 0 > 0 ? currentArticle?.media?.first?.media_metadata?.last?.url:"":""
        
        var dateString = ""
        if (currentArticle?.published_date != nil){
            let dateArray = currentArticle?.published_date?.components(separatedBy: "T")
            
            dateString = dateArray!.count > 0 ? dateArray![0]  : ""
        }
        
        self.selectedArticle = ArticleDetailsViewModel(heading: currentArticle?.title ?? "", authorText: currentArticle?.byline ?? "" , imageUrl: detailImage, dateText: dateString, detailsText: currentArticle?.abstract ?? "")
     
        
    }
}




