//
//  ViewController.swift
//  NetworkApp
//
//  Created by Test on 11/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var catImage: UIImageView!
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        networkManager.fetchCatImage() { randomCat in
            self.updateInterfaceWith(randomCat: randomCat)
        }
    }

    @IBAction func showButtonPressed(_ sender: UIButton) {
        networkManager.fetchCatImage() { randomCat in
            self.updateInterfaceWith(randomCat: randomCat)
        }
    }
    
    func updateInterfaceWith(randomCat: RandomCat) {
        //guard let image = UIImage(self.randomCat.catWebpurl) else {return}
        DispatchQueue.main.async {
        self.catImage.image = UIImage(systemName: randomCat.catWebpurl)
            print(randomCat.catWebpurl)
            }
            
    }

//guard let image = UIImage(data: data) else { return }
//DispatchQueue.main.async {
    //self.imageView.image = image
   // self.activityIndicator.stopAnimating()
}

