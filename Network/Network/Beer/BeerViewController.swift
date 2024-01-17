//
//  BeerViewController.swift
//  Network
//
//  Created by 박희지 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet var headerView: UIView!
    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var randomThumbnailImageView: UIImageView!
    @IBOutlet var randomNameLabel: UILabel!
    
    @IBOutlet var moreDetailButton: UIButton!
    
    var randomBeer: Beer? {
        didSet {
            updateRandomBeer()
        }
    }
    
    lazy var beerList: BeerList = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cofigureUI()
        cofigureTableView()
        
        fetchRandomBeer()
        fetchBeerList()
    }
    
    @IBAction func resetRandomButtonTapped(_ sender: Any) {
        fetchRandomBeer()
    }
    
    @IBAction func moreDetailButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: BeerDetailViewController.identifier) as! BeerDetailViewController
        
        vc.bindBeer(beer: randomBeer)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchRandomBeer() {
        BeerAPI.getRandom { beer in
            self.randomBeer = beer
        }
    }
    
    func fetchBeerList() {
        DispatchQueue.global().async {
            BeerAPI.getBeerList { list in
                self.beerList = list
            }
        }
    }
    
    func updateRandomBeer() {
        guard let randomBeer else { return }
        let beerInfo = BeerInfo(beer: randomBeer)
        
        if randomBeer.image_url != nil {
            randomThumbnailImageView.kf.setImage(with: beerInfo.imageURL)
        } else {
            let dummyImage = UIImage(named: "beer")?.withRenderingMode(.alwaysOriginal)
            randomThumbnailImageView.image = dummyImage
        }
        randomNameLabel.text = randomBeer.name
    }
}

// MARK: - custom UI
extension BeerViewController {
    func cofigureUI() {
        randomNameLabel.numberOfLines = 2
        randomThumbnailImageView.contentMode = .scaleAspectFit
        moreDetailButton.setCornerRadius()
    }
    
    func cofigureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = UITableView.automaticDimension
    }
}

extension BeerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier, for: indexPath) as! BeerTableViewCell
        let beer = beerList[indexPath.row]
        
        
        cell.bindItem(beer: beer)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "🍻 더 많은 맥주를 알아볼까요?"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: BeerDetailViewController.identifier) as! BeerDetailViewController
        
        let beer = beerList[indexPath.row]
        
        vc.bindBeer(beer: beer)
        navigationController?.pushViewController(vc, animated: true)
    }
}
