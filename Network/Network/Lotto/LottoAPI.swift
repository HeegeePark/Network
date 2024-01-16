//
//  LottoAPI.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation
import Alamofire

class LottoAPI {
    // 로또 번호 가져오기
    static func fetchLotto(date: Int, _ completion: @escaping ((Lotto) -> Void)) {
        let url = APIManager.lotto(date: date).requestURL
        AF.request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    completion(success)
                case .failure(let failure):
                    print("오류 발생", failure, terminator: " ")
                }
            }
    }
}
