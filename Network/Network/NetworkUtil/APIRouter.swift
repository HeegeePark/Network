//
//  APIRouter.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import Foundation
import Alamofire

class APIRouter {
    
    var apiType: APIType
    
    var queryItems: [URLQueryItem]? {
        switch apiType {
        case .lotto(let date):
            return [URLQueryItem(name: "method", value: "getLottoNumber"),
                    URLQueryItem(name: "drwNo", value: String(date))]
        
        case .beer(let service):
            switch service {
            case .random:
                return nil
            case .list(let page, let perPage):
                var items = [URLQueryItem]()
                
                if let page {
                    items.append(URLQueryItem(name: "page", value: String(page)))
                }
                
                if let perPage {
                    items.append(URLQueryItem(name: "per_page", value: String(perPage)))
                }
                
                return items
            }
        }
    }
    
    init(apiType: APIType) {
        self.apiType = apiType
    }
    
    var requestURL: String {
        var components = URLComponents(string: apiType.baseURL + apiType.path)!
        
        if let items = queryItems {
            components.queryItems = items
        }
        
        return components.string!
    }
}
