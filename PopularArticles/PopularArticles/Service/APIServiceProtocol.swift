//
//  APIServiceProtocol.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//



import Foundation

protocol APIServiceProtocol {
    func fetchArticleList(periods: Periods, completion: @escaping (_ isSuccess: Bool, _ results: [Article], _ error: Error?) -> Void)
}
