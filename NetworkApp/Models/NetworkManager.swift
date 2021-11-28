//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import Foundation

class NetworkManager {
    func fetchCatImage(completionHandler: @escaping (RandomCat) -> Void){
        let urlString = "https://thatcopy.pw/catapi/restId/1"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, responce, error in
            if let data = data {
                if let randomCat =  self.parseJSON(withData: data){
                    completionHandler(randomCat)
                }
            }
        }
        task.resume()
    }
    func parseJSON(withData data: Data) -> RandomCat? {
        let decoder = JSONDecoder()
        do {
            let animal = try decoder.decode(Animal.self, from: data)
           guard let randomCat = RandomCat(animal: animal)
            else {
                return nil
            }
            return randomCat
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
