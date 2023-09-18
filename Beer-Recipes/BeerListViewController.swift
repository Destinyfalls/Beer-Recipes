//
//  BeerListViewController.swift
//  Beer-Recipes
//
//  Created by Igor Belobrov on 18.09.2023.
//

import UIKit

class BeerListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var beerTableView: UITableView! {
        didSet {
            beerTableView.dataSource = self
            beerTableView.delegate = self
        }
    }
    
    private var beersData = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBeers()
    }
    
    private func loadBeers() {
        NetworkManager.shared.getResult { data in
            guard let beers = data else { return }
            self.beersData = beers
            DispatchQueue.main.async {
                self.beerTableView.reloadData()
            }
        }
    }
    
    // MARK: - UITableViewDelegate/UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell", for: indexPath) as! BeerTableViewCell
        let beer = beersData[indexPath.row]
        cell.configureCell(data: beer)
        cell.selectionStyle = .none
        return cell
    }
}

