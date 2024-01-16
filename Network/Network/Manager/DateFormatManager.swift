//
//  DateFormatManager.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import Foundation

class DateFormatManager {
    static let `default` = DateFormatManager()
    
    static let dateFormatter = DateFormatter()
    
    private init() {}
    
    static func formattedString(data: String, inputFormat: String = "yyyy-MM-dd", outputFormat: String = "yyyy년 M월 dd일", locale: String = "ko_KR") -> String {
        
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: data) else { return "" }
        
        dateFormatter.dateFormat = outputFormat
        
        return dateFormatter.string(from: date)
    }
}
