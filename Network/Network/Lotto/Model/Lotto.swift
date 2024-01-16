//
//  Lotto.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation

struct Lotto: Codable {
    let drwNo: Int
    let drwNoDate: String
    let drwtNo6, drwtNo4, drwtNo5: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
    let bnusNo: Int
}
