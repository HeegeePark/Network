//
//  APIManager.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation

enum APIManager {
    case lotto(date: Int)
    
    var baseURL: String {
        switch self {
        case .lotto:
            return BaseURL.lotto
        }
    }
    
    var path: String {
        switch self {
        case .lotto(let date):
            return "?method=getLottoNumber&drwNo=\(date)"
        }
    }
    
    var requestURL: String {
        return baseURL + path
    }
}
