//
//  ScoreViewController.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class ScoreViewController: UIViewController {
    
    var scoreGame = ScoreGame()
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBOutlet weak var trueScoreLabel: UILabel!
    @IBOutlet weak var falseScoreLabel: UILabel!
    @IBOutlet weak var winWordsTextView: UITextView!
    @IBOutlet weak var loseWordsTextView: UITextView!
    @IBOutlet weak var numberTeamScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goNextButton.layer.cornerRadius = 30
        trueScoreLabel.text = "Угадано: \(scoreGame.scoreWin.count)"
        falseScoreLabel.text = "Не угадано: \(scoreGame.scoreLose.count)"
        winWordsTextView.isEditable = false
        loseWordsTextView.isEditable = false
        printWinWord()
        printLoseWord()
        Gradient.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNumberRule()
    }
    
    @IBAction func goNextButtonClicked(_ sender: Any) {
        let numberGame = UserDefaults.standard.integer(forKey: "numberGame")
        UserDefaults.standard.setValue(1, forKey: "numberGame")
        if !(numberGame == 1) {
            saveFirstTeam()
            guard var viewControllers = navigationController?.viewControllers else { return }
            viewControllers.removeLast(2)
            navigationController?.setViewControllers(viewControllers, animated: true)
        } else {
            UserDefaults.standard.removeObject(forKey: "numberGame")
            saveSecondTeam()
            guard var viewControllers = navigationController?.viewControllers else { return }
            viewControllers.removeLast(3)
            navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
    
    func showNumberRule(){
        let numberGame = UserDefaults.standard.integer(forKey: "numberGame")
        if !(numberGame == 1) {
            numberTeamScoreLabel.text = "Счет команды №1"
        } else {
            numberTeamScoreLabel.text = "Счет команды №2"
        }
    }
    
    func printWinWord(){
        let wordsWin = scoreGame.scoreWin.joined(separator: "\n\n")
        winWordsTextView.text = "\(wordsWin)"
    }
    
    func printLoseWord(){
        let wordsLose = scoreGame.scoreLose.joined(separator: "\n\n")
        loseWordsTextView.text = "\(wordsLose)"
    }
    
    func saveFirstTeam() {
        var firstMass = UserDefaults.standard.array(forKey: "firstMass") ?? []
        firstMass.append("\(scoreGame.scoreWin.count)")
        UserDefaults.standard.setValue(firstMass, forKey: "firstMass")
    }
    
    func saveSecondTeam() {
        var secondMass = UserDefaults.standard.array(forKey: "secondMass") ?? []
        secondMass.append("\(scoreGame.scoreWin.count)")
        UserDefaults.standard.setValue(secondMass, forKey: "secondMass")
    }
    
}
