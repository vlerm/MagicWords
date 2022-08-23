//
//  Utilities.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class ScoreGame {
    
    var scoreWin = [String]()
    var scoreLose = [String]()
    
    init (){
    }
    
}

class Gradient {
    
    static func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
