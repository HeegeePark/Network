//
//  BeerTableViewCell.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {
    static let identifier = "BeerTableViewCell"

    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var beer: Beer? {
        didSet {
            updateUI()
        }
    }
    
    func configureUI() {
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.image = UIImage(named: "beer")?.withRenderingMode(.alwaysOriginal)
    }
    
    func bindItem(beer: Beer?) {
        self.beer = beer
    }
    
    func updateUI() {
        configureUI()
        
        guard let beer else { return }
        let beerInfo = BeerInfo(beer: beer)
        
        if beer.image_url != nil {
            thumbnailImageView.kf.setImage(with: beerInfo.imageURL)
        }
        
        nameLabel.text = beer.name
    }
}
