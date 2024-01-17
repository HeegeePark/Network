//
//  BeerDetailViewController.swift
//  Network
//
//  Created by 박희지 on 1/17/24.
//

import UIKit
import Kingfisher

class BeerDetailViewController: UIViewController {
    static let identifier = "BeerDetailViewController"
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var beer: Beer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        updateUI()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "👍 오늘의 추천 맥주"
        
        let backButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.left"), target: self, action: #selector(pushTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func pushTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureUI() {
        nameLabel.textAlignment = .center
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
    func updateUI() {
        guard let beer else { return }
        let beerInfo = BeerInfo(beer: beer)
        
        thumbnailImageView.kf.setImage(with: beerInfo.imageURL)
        nameLabel.text = beer.name
        descriptionLabel.text = beer.description
    }
    
    func bindBeer(beer: Beer?) {
        self.beer = beer
    }
}
