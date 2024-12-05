//
//  ViewController.swift
//  Budget App
//
//  Created by Rabinowitz, Jordyn on 12/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balanceOnMainPage: UILabel!
    
    @IBOutlet weak var cashOnMainPage: UILabel!
    
    @IBOutlet weak var cardOnMainPage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let balanceSaved = UserDefaults.standard.integer(forKey: "balance")

        balance = balanceSaved

        let cashSaved = UserDefaults.standard.integer(forKey: "cash")
        
        cash = cashSaved

        let cardSaved = UserDefaults.standard.integer(forKey: "card")
        
        card = cardSaved
        
        balanceOnMainPage.text = "$\(balance)"
        cashOnMainPage.text = "$\(cash)"
        cardOnMainPage.text = "$\(card)"
       
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        balanceOnMainPage.text = "$\(balance)"
        cashOnMainPage.text = "$\(cash)"
        cardOnMainPage.text = "$\(card)"
    }
  
}

