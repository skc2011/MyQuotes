//
//  HomeViewController.swift
//  MyQuotes
//
//  Created by SKC on 12/8/18.
//  Copyright © 2018 SKC-PRO. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard
var imageBorder : Bool {
    get {
        return defaults.bool(forKey: "imageBorder")
    } set {
        defaults.set( newValue, forKey:"imageBorder")
    }
}


class HomeViewController: UIViewController {
    
    @IBOutlet weak var quoteImgView: UIImageView!
    
    @IBOutlet weak var backClickLabel: UIButton!

    @IBOutlet weak var nextClickLabel: UIButton!
    
    @IBOutlet var homeButtons: [UIButton]!
    
    var quoteArray = ["quote0","quote1","quote2","quote3","quote4","quote5","quote6","quote7","quote8","quote9"]
    
    var arrayIndex: Int {
        get {
            return defaults.integer(forKey: "arrayIndex")
        } set {
            defaults.set( newValue, forKey:"arrayIndex")
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let themeValue = defaults.integer(forKey: "theme")
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            setButtonBorders(color: .white)
        } else {
            view.backgroundColor = UIColor.white
            setButtonBorders(color: .black)
        }
        //        let isBorder = defaults.bool(forKey: "borderState")
        if imageBorder {
            quoteImgView.layer.borderColor = UIColor.red.cgColor
            quoteImgView.layer.borderWidth = 5.0
            quoteImgView.layer.cornerRadius = 15.0
        } else {
            quoteImgView.layer.borderWidth = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backClickLabel.isHidden = true // строчка работает, если сначала будет индекс - 0
    }
    
    
    @IBAction func backClicked(_ sender: Any) {
        
        if arrayIndex > 0 {
            nextClickLabel.isHidden = false
            arrayIndex -= 1
            if let image = UIImage(named: quoteArray[arrayIndex]){
                quoteImgView.image = image
                backClickLabel.isHidden = false
                if arrayIndex == 0 {
                    backClickLabel.isHidden = true
                }
            }
        }
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        if arrayIndex < quoteArray.count-1 {
            backClickLabel.isHidden = false
            arrayIndex += 1
            if let image = UIImage(named: quoteArray[arrayIndex]){
                quoteImgView.image = image
                nextClickLabel.isHidden = false
                if arrayIndex == quoteArray.count-1 {
                    nextClickLabel.isHidden = true
                }
            }
        } 
    }
    
    
    @IBAction func favoriteClicked(_ sender: Any) {
        
        defaults.set(arrayIndex, forKey: "favoriteIndex")
    }
    
    func setButtonBorders(color: UIColor) {
        for button in homeButtons {
            button.layer.cornerRadius = 25.0
            button.layer.borderWidth = 3.5
            button.layer.borderColor = color.cgColor
        }
    }
}
