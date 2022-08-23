//
//  ViewController.swift
//  MagicWords
//
//  Created by Вадим Лавор on 14.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var continueGameButton: UIButton!
    @IBOutlet weak var startNewGameButton: UIButton!
    @IBOutlet weak var hatView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGameButton.layer.cornerRadius = 30
        continueGameButton.layer.cornerRadius = 30
        setGradientBackground(view: self.view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func showAlertMessageButtonClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Начать новую игру?", message: "Результаты прошлой игры будут сброшены", preferredStyle: .alert)
        let continueAlertAction = UIAlertAction(title: "Начать", style: .default) { action in
            self.performSegue(withIdentifier: "ruleSegue", sender: nil)
            UserDefaults.standard.removeObject(forKey: "numberGame")
            UserDefaults.standard.removeObject(forKey: "firstMass")
            UserDefaults.standard.removeObject(forKey: "secondMass")
        }
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(continueAlertAction)
        alertController.addAction(cancelAlertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setGradientBackground(view: UIView, colorTop: CGColor = UIColor(red: 29.0/255.0, green: 34.0/255.0, blue:234.0/255.0, alpha: 1.0).cgColor, colorBottom: CGColor = UIColor(red: 38.0/255.0, green: 0.0/255.0, blue: 6.0/255.0, alpha: 1.0).cgColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
