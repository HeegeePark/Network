//
//  UIView+Extension.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import UIKit

extension UIView {
    func setCornerRadius(style: CornerRoundStyle = .default) {
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
    }
}
