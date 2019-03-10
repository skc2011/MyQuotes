//
//  SettingsViewController.swift
//  MyQuotes
//
//  Created by SKC on 12/10/18.
//  Copyright © 2018 SKC-PRO. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var settingsLabel: [UILabel]!
    
    @IBOutlet weak var segmentedTheme: UISegmentedControl!
    
    @IBOutlet weak var switchBorder: UISwitch!
    
    @IBOutlet weak var stepperFavorite: UIStepper!
    
        
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let themeValue = defaults.integer(forKey: "theme")
        
        if themeValue == 0 {
            view.backgroundColor = UIColor.black
            changeTheme(color: .white)
            segmentedTheme.selectedSegmentIndex = themeValue
        } else {
            view.backgroundColor = UIColor.white
            changeTheme(color: .black)
            segmentedTheme.selectedSegmentIndex = themeValue
        }
//        let state = defaults.bool(forKey: "borderState")
        if imageBorder {
            switchBorder.setOn(true, animated: false)
        } else {
            switchBorder.setOn(false, animated: false    )
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func segmentedChanged(_ sender: Any) {
        
        let index = segmentedTheme.selectedSegmentIndex
        defaults.set(index, forKey: "theme")
        if index == 0 {
            view.backgroundColor = UIColor.black
            changeTheme(color: UIColor.white)
        } else {
            view.backgroundColor = UIColor.white
            changeTheme(color: UIColor.black)
        }
    }
    
    
    func changeTheme (color : UIColor) {
    
        for label in settingsLabel {
            label.textColor = color
        }
        segmentedTheme.tintColor = color
        switchBorder.onTintColor = color
        stepperFavorite.tintColor = color
    }
    
    
    @IBAction func switchChanged(_ sender: Any) {
        let state = switchBorder.isOn
//        defaults.set(state, forKey: "borderState")
        
        if state {
            imageBorder = true
            print(state)
        } else {
            imageBorder = false
            print(state)
        }
    }
}
