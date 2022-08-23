//
//  GameViewController.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class GameViewController: UIViewController {
    
    var scoreGame = ScoreGame()
    var countDown = 59
    var timer = Timer()
    var numberOfWords = Int()
    var wordsArray = [String]()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberWordsLabel: UILabel!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var numberTeamGameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    
    override func viewDidLoad() {
        passButton.layer.cornerRadius = 30
        winButton.layer.cornerRadius = 30
        timerLabel.text = "00:\(countDown)"
        numberWordsLabel.text = "Угадано \(numberOfWords) слов"
        super.viewDidLoad()
        readFile()
        generateRandomWord()
        Gradient.setGradientBackground(view: self.view, colorTop: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1).cgColor, colorBottom: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1).cgColor)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showNumberRule()
    }
    
    @IBAction func notGuessedWordButtonClicked(_ sender: Any) {
        if countDown > 0 {
            generateRandomWord()
            scoreGame.scoreLose.append(wordsLabel.text!)
        }
    }
    
    @IBAction func guessedWordButtonClicked(_ sender: Any) {
        if countDown > 0 {
            generateRandomWord()
            numberOfWords += 1
            numberWordsLabel.text = "Угадано \(numberOfWords) слов"
            scoreGame.scoreWin.append(wordsLabel.text!)
        }
    }
    
    @objc func updateTime(){
        timerLabel.text = "\(setTimeFormatted(countDown))"
        if countDown != 0 {
            countDown -= 1
        } else {
            endTimer()
        }
    }
    
    func showNumberRule(){
        let numberGame = UserDefaults.standard.integer(forKey: "numberGame")
        if !(numberGame == 1) {
            numberTeamGameLabel.text = "Ход команды №1"
        } else {
            numberTeamGameLabel.text = "Ход команды №2"
        }
    }
    
    func readFile() {
        if let path = Bundle.main.path(forResource: "words", ofType: "txt"){
            if let textWords = try? String(contentsOfFile: path){
                wordsArray = textWords.components(separatedBy: "\n")
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        timer.invalidate()
        let scoreViewController = storyboard?.instantiateViewController(identifier: "ScoreViewController") as! ScoreViewController
        scoreViewController.scoreGame = scoreGame
        self.navigationController?.pushViewController(scoreViewController, animated: true)
    }
    
    func startTimer(_ sender: Any) {
        startTimer()
    }
    
    func setTimeFormatted(_ totalSecond: Int) -> String {
        let second: Int = totalSecond % 60
        return String(format:"00:%02d", second)
    }
    
    func generateRandomWord(){
        let randomSymbol = Int.random(in: 0...wordsArray.count - 2)
        wordsLabel.text = wordsArray[randomSymbol]
    }
    
}
