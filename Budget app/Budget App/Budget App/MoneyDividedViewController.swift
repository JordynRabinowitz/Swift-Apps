//
//  MoneyDividedViewController.swift
//  Budget App
//
//  Created by Rabinowitz, Jordyn on 1/11/22.
//

import UIKit



class MoneyDividedViewController: UIViewController {
    
    @IBOutlet weak var foodMoneyOutlet: UILabel!
    
    
    @IBOutlet weak var transportMoneyOutlet: UILabel!
    
    @IBOutlet weak var insuranceMoneyOutlet: UILabel!
    
    @IBOutlet weak var clothingMoneyOutlet: UILabel!
    
    @IBOutlet weak var dreamFundMoneyOutlet: UILabel!
    
    
   


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let balanceSaved = UserDefaults.standard.integer(forKey: "balance")

        balance = balanceSaved
       
        let thirtyPercent = (Int)((balance * 30)/100)
        
        let twentyPercent = (Int)((balance * 20)/100)
        let tenPercent = (Int)((balance * 10)/100)
        
        foodMoneyOutlet.text = "$\(thirtyPercent)"
        transportMoneyOutlet.text = "$\(thirtyPercent)"
        insuranceMoneyOutlet.text = "$\(twentyPercent)"
        clothingMoneyOutlet.text = "$\(tenPercent)"
        dreamFundMoneyOutlet.text = "$\(tenPercent)"

        // Do any additional setup after loading the view.
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
