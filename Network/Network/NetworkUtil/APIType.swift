//
//  APIType.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation
import Alamofire

enum APIType {
    case lotto(date: Int)
    case beer(service: Service)
}

extension APIType {
    var baseURL: String {
        switch self {
        case .lotto:
            return BaseURL.lotto
        case .beer:
            return BaseURL.beer
        }
    }
    
    var path: String {
        switch self {
        case .lotto:
            return "common.do"
        case .beer(let service):
            switch service {
            case .random:
                return "beers/random"
            case .list:
                return "beers"
            }
        }
    }
}

enum Service {
    case random
    case list(page: Int?, perPage: Int?)
}
