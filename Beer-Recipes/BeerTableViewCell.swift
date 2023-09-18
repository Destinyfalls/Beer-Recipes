//
//  BeerTableViewCell.swift
//  Beer-Recipes
//
//  Created by Igor Belobrov on 18.09.2023.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(data: Beer) {
        nameLabel.text = data.name
        descriptionLabel.text = data.description
        loadImage(imageUrl: data.image_url)
    }
    
    func loadImage(imageUrl: String?) {
        if let url = URL(string: imageUrl ?? "") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let imageData = data else { return }
                  DispatchQueue.main.async {
                      self.beerImageView.image = UIImage(data: imageData)
                  }
                }.resume()
        }
    }
    
}
