//
//  NetworkManager.swift
//  Beer-Recipes
//
//  Created by Igor Belobrov on 18.09.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let url = URL(string: "https://api.punkapi.com/v2/beers")!
    
    func getResult(completion: @escaping ([Beer]?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error  in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode([Beer].self, from: data)
                completion(result)
            } catch {
                print("Error decoding == \(error)")
            }
        }
        task.resume()
    }
}
