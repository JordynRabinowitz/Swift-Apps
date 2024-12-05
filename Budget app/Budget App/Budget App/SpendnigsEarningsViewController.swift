//
//  SpendnigsEarningsViewController.swift
//  Budget App
//
//  Created by Rabinowitz, Jordyn on 12/20/21.
//

import UIKit

class SpendnigsEarningsViewController: UIViewController {
    
    
    @IBOutlet weak var balanceOnSpendingsScreen: UILabel!
    
    
    @IBOutlet weak var earningsTextField: UITextField!
    
    @IBOutlet weak var spendinsTextField: UITextField!
    
    
    
   //var balance = 0
   //var cash = 0
   //var card = 0
    var add = 0
    var subtract = 0
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let balanceSaved = UserDefaults.standard.integer(forKey: "balance")

        balance = balanceSaved

        let cashSaved = UserDefaults.standard.integer(forKey: "cash")
        
        cash = cashSaved

        let cardSaved = UserDefaults.standard.integer(forKey: "card")
        
        card = cardSaved
        
            balanceOnSpendingsScreen.text = "$\(balance)"
        

        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    @IBAction func addMoneyButton(_ sender: UIButton) {
       add = Int(earningsTextField.text!)!
        balance += add
        balanceOnSpendingsScreen.text = "$\(balance)"
        
        earningsTextField.resignFirstResponder()
        
        let alert = UIAlertController(title: "Which type did you earn?", message: "", preferredStyle: .alert)
        let buttonOne = UIAlertAction(title: "Card", style: .default ){ Action in
            card += self.add
            
            let cardSaved = card
            UserDefaults.standard.set(cardSaved, forKey: "card")
        }
        let buttonTwo = UIAlertAction(title: "Cash", style: .default){ Action in
            cash += self.add
           
            let cashSaved = cash
            UserDefaults.standard.set(cashSaved, forKey: "cash")
        }
        
        alert.addAction(buttonOne)
        alert.addAction(buttonTwo)
        present(alert, animated: true, completion: nil)
        
        let balanceSaved = balance
        UserDefaults.standard.set(balanceSaved, forKey: "balance")
        
        earningsTextField.text = ""
    
    
    }
    
    @IBAction func subtractMoneyButton(_ sender: UIButton) {
        subtract = Int(spendinsTextField.text!)!
        balance -= subtract
        balanceOnSpendingsScreen.text = "$\(balance)"
        
        spendinsTextField.resignFirstResponder()
        
        let alert = UIAlertController(title: "Which type did you earn?", message: "", preferredStyle: .alert)
        let buttonOne = UIAlertAction(title: "Card", style: .default ){ Action in
            card -= self.subtract
            
            let cardSaved = card
            UserDefaults.standard.set(cardSaved, forKey: "card")
        }
        let buttonTwo = UIAlertAction(title: "Cash", style: .default){ Action in
            cash -=  self.subtract
            
            let cashSaved = cash
            UserDefaults.standard.set(cashSaved, forKey: "cash")
        }
        
        alert.addAction(buttonOne)
        alert.addAction(buttonTwo)
        present(alert, animated: true, completion: nil)
       
        let balanceSaved = balance
        UserDefaults.standard.set(balanceSaved, forKey: "balance")
        
        spendinsTextField.text = ""
        
    }
    
    
    @IBAction func clearBalanceButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Are you sure you want to clear your balance?", message: "", preferredStyle: .alert)
        let buttonOne = UIAlertAction(title: "yes", style: .default ){ Action in
            balance = 0
            card = 0
            cash = 0
            self.balanceOnSpendingsScreen.text = "$\(balance)"
            
            let balanceSaved = balance
            UserDefaults.standard.set(balanceSaved, forKey: "balance")
            let cashSaved = cash
            UserDefaults.standard.set(cashSaved, forKey: "cash")
            let cardSaved = card
            UserDefaults.standard.set(cardSaved, forKey: "card")
        }
        let buttonTwo = UIAlertAction(title: "No", style: .default)
       
        alert.addAction(buttonOne)
        alert.addAction(buttonTwo)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    @IBAction func backButton(_ sender: UIButton) {
            dismiss(animated: true, completion: nil)
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
