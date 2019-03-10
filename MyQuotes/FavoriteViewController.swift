//
//  FavoriteViewController.swift
//  MyQuotes
//
//  Created by SKC on 12/9/18.
//  Copyright © 2018 SKC-PRO. All rights reserved.
//

import UIKit


class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var favoriteImgView: UIImageView!
    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let themeValue = defaults.integer(forKey: "theme")
        
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            favoriteLabel.textColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.white
            favoriteLabel.textColor = UIColor.black
        }
        
        let index = defaults.integer(forKey: "favoriteIndex")
        let image = UIImage(named: "quote\(index)")
        favoriteImgView.image = image
        
        if imageBorder {
            favoriteImgView.layer.borderColor = UIColor.red.cgColor
            favoriteImgView.layer.borderWidth = 5.0
            favoriteImgView.layer.cornerRadius = 15.0
        } else {
            favoriteImgView.layer.borderWidth = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
