//
//  BeerTableViewCell.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {
    static let identfier = "BeerTableViewCell"

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func configureUI() {
        thumbnailImageView.contentMode = .scaleAspectFit
    }
    
    func bindItem(beer: Beer?) {
        guard let beer else { return }
        let beerInfo = BeerInfo(beer: beer)
        
        thumbnailImageView.kf.setImage(with: beerInfo.imageURL)
        nameLabel.text = beer.name
    }
}
