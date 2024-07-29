//
//  NetworkService.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//



import Foundation

fileprivate let api_key = "ffRgQJS5c0vyzfLcQzL9gm7eKVnUjX6J"


class NetworkService : APIServiceProtocol {
    
    func fetchArticleList(periods: Periods, completion: @escaping (_ success: Bool, _ results: [Article], _ error: Error?) -> Void) {
        loadData({ isSuccess, articles, err in
            completion(isSuccess, articles, err)
        }, period: periods)
    }
    
    private func loadData(_ completion: @escaping (_ success: Bool, _ results: [Article], _ error: Error?) -> Void, period: Periods) {
        
         let url = "\(URL_Strings.baseUrl)\(URL_Strings.most_popular_url)\(period.rawValue).json"
        
        guard var components = URLComponents(string: url) else {
            print("URLCompontents createion failed")
            return
        }
        components.queryItems = [URLQueryItem(name: "api-key", value: api_key)]

        guard let url = components.url else {
            print("URL Creation Failed")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        debugPrint(request.description)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            //Handle error case
            guard error == nil else {
                completion( false,[], error )

                return
            }
            
            
            
            guard let articles = try? JSONDecoder().decode(ArticlesResponse.self, from: data!) else {
                completion( false,[], error )
                return
            }
            
            DispatchQueue.main.async {
                
                completion(true, articles.articles ?? [], nil)
                
            }
            
        }.resume()
    }
    
}
