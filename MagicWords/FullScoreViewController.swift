//
//  FullScoreViewController.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class FullScoreViewController: UIViewController {
    
    let firstMass = UserDefaults.standard.array(forKey: "firstMass") as? [String] ?? []
    let secondMass = UserDefaults.standard.array(forKey: "secondMass") as? [String] ?? []
    
    @IBOutlet weak var firstTeamTextView: UITextView!
    @IBOutlet weak var secondTeamTextView: UITextView!
    @IBOutlet weak var firstNumberTeamLabel: UILabel!
    @IBOutlet weak var secondNumberTeamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTeamTextView.text = firstMass.joined(separator: "\n")
        secondTeamTextView.text = secondMass.joined(separator: "\n")
        firstTeamTextView.isEditable = false
        secondTeamTextView.isEditable = false
        showNumberWordsFirstTeam()
        showNumberWordsSecondTeam()
        Gradient.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    func showNumberWordsFirstTeam(){
        let firstTeam = firstMass.map({Int($0)})
        var sum = Int()
        for i in firstTeam {
            sum += i ?? Int()
        }
        firstNumberTeamLabel.text = "Слов: \(sum)"
    }
    
    func showNumberWordsSecondTeam(){
        let secondTeam = secondMass.map({Int($0)})
        var sum = Int()
        for i in secondTeam {
            sum += i ?? Int()
        }
        secondNumberTeamLabel.text = "Слов: \(sum)"
    }
    
}
