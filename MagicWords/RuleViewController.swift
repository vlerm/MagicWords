//
//  RuleViewController.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class RuleViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var numberTeamRuleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 30
        Gradient.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 23/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 17/255, green: 1/255, blue: 23/255, alpha: 1).cgColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNumberRule()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? GameViewController else { return }
        destination.startTimer()
    }
    
    func showNumberRule(){
        let numberGame = UserDefaults.standard.integer(forKey: "numberGame")
        if !(numberGame == 1) {
            numberTeamRuleLabel.text = "Ход команды №1"
        } else {
            numberTeamRuleLabel.text = "Ход команды №2"
        }
    }
    
}
