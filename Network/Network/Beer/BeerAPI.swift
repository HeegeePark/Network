//
//  BeerAPI.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation
import Alamofire

class BeerAPI {
    static var page = 1
    
    static func getRandom(_ completion: @escaping ((Beer) -> Void)) {
        let url = APIRouter(apiType: .beer(service: .random)).requestURL
        AF.request(url, method: .get)
            .responseDecodable(of: BeerList.self) { response in
                switch response.result {
                case .success(let success):
                    completion(success.first!)
                case .failure(let failure):
                    print("BeerAPI getRandom 오류 발생", failure)
                }
            }
    }
    
    static func getBeerList(_ completion: @escaping ((BeerList) -> Void)) {
        let url = APIRouter(apiType: .beer(service: .list(page: page, perPage: nil))).requestURL
        print(url)
        AF.request(url, method: .get)
            .responseDecodable(of: BeerList.self) { response in
                switch response.result {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print("BeerAPI getBeerList 오류 발생", failure)
                }
            }
    }
}
