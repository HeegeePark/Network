//
//  LottoInfo.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation

struct LottoInfo {
    let lotto: Lotto
    
    var dateFormattedDate: String {
        return DateFormatManager.formattedString(data: lotto.drwNoDate)
    }
    
    var title: String {
        return "\(dateFormattedDate) \(lotto.drwNo)회차 당첨번호"
    }
    
    var result: String {
        return [lotto.drwtNo1, lotto.drwtNo2, lotto.drwtNo3, lotto.drwtNo4, lotto.drwtNo5, lotto.drwtNo6, lotto.bnusNo].map { String($0) }.joined(separator: " ")
    }
}
