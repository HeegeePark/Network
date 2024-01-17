//
//  BeerInfo.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import Foundation

struct BeerInfo {
    let beer: Beer
    
    var imageURL: URL? {
        return URL(string: beer.image_url)
    }
}
