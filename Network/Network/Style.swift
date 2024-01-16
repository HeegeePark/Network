//
//  Style.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import UIKit

enum FontStyle {
    static let lottoTitle: UIFont = .systemFont(ofSize: 22, weight: .bold)
    static let lottoResult: UIFont = .systemFont(ofSize: 17, weight: .bold)
}

enum ColorStyle {
    static let lottoAccentColor = UIColor(red: 14 / 256, green: 110 / 256, blue: 165 / 256, alpha: 1.0)
}

enum CornerRoundStyle {
    case `default`
    case small
    case medium
    case large
    case circle(UIView)
    
    var cornerRadius: CGFloat {
        switch self {
        case .default:
            return 10
        case .small:
            return 8
        case .medium:
            return 16
        case .large:
            return 20
        case .circle(let view):
            return view.frame.width / 2
        }
    }
}
