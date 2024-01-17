//
//  Beer.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import Foundation

typealias BeerList = [Beer]

struct Beer: Codable {
    let id: Int
    let name: String
    let description: String
    let image_url: String?
}
