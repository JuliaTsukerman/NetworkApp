//
//  ViewController.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var catImageView: UIImageView!
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.onCompletion = { [weak self] randomCat in
            guard let self = self else {return}
            self.updateInterfaceWith(randomCat: randomCat)
        }
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        self.networkManager.fetchCatImage()
        networkManager.onCompletion = { [weak self] randomCat in
            guard let self = self else {return}
            self.updateInterfaceWith(randomCat: randomCat)
            print(randomCat.self)
        }
        
    }
    
    func updateInterfaceWith(randomCat: RandomCat) {
        DispatchQueue.main.async {
            let url = URL(string: randomCat.catUrl)
            guard let data = try? Data(contentsOf: url!) else {return}
                        self.catImageView.image = UIImage(data: data)
        }
        
    }
}

