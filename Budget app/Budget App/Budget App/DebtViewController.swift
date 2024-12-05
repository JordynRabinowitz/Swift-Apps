//
//  DebtViewController.swift
//  Budget App
//
//  Created by Rabinowitz, Jordyn on 12/20/21.
//

import UIKit

class DebtViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var name1TextField: UITextField!
    
    @IBOutlet weak var youOwe1TextField: UITextField!
    
    @IBOutlet weak var theyOwe1TextField: UITextField!
    
    
    @IBOutlet weak var name2TextField: UITextField!
    
    @IBOutlet weak var youOwe2TextField: UITextField!
    
    @IBOutlet weak var theyOwe2TextField: UITextField!
    
    @IBOutlet weak var name3TextField: UITextField!
    
    @IBOutlet weak var youOwe3TextField: UITextField!
    
    
    @IBOutlet weak var theyOwe3TextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
        
        if let name1 = UserDefaults.standard.string(forKey: "savedName1"){
            name1TextField.text = name1
        }
        if let youOwe1 = UserDefaults.standard.string(forKey: "savedYouOwe1"){
            youOwe1TextField.text = youOwe1}
       
    
        if let theyOwe1 = UserDefaults.standard.string(forKey: "savedTheyOwe1"){
            theyOwe1TextField.text = theyOwe1}
        
        
        if let name2 = UserDefaults.standard.string(forKey: "savedName2"){
            name2TextField.text = name2
        }
        if let youOwe2 = UserDefaults.standard.string(forKey: "savedYouOwe2"){
            youOwe2TextField.text = youOwe2}
        
        if let theyOwe2 = UserDefaults.standard.string(forKey: "savedTheyOwe2"){
            theyOwe2TextField.text = theyOwe2}
        
        if let name3 = UserDefaults.standard.string(forKey: "savedName3"){
            name3TextField.text = name3
        }
        if let youOwe3 = UserDefaults.standard.string(forKey: "savedYouOwe3"){
            youOwe3TextField.text = youOwe3}
        
        if let theyOwe3 = UserDefaults.standard.string(forKey: "savedtTheyOwe3"){
            theyOwe3TextField.text = theyOwe3}
    
        
        
        // Do any additional setup after loading the view.
    
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    
    
    @IBAction func saveButton1(_ sender: UIButton) {
        let name1 = name1TextField.text!
        UserDefaults.standard.set( name1, forKey: "savedName1")
        let youOwe1 = youOwe1TextField.text!
        UserDefaults.standard.set(youOwe1, forKey: "savedYouOwe1")
        let theyOwe1 = theyOwe1TextField.text!
        UserDefaults.standard.set(theyOwe1, forKey: "savedTheyOwe1")
        
    }
    
    @IBAction func saveButton2(_ sender: UIButton) {
        let name2 = name2TextField.text!
        UserDefaults.standard.set( name2, forKey: "savedName2")
        let youOwe2 = youOwe2TextField.text!
        UserDefaults.standard.set(youOwe2, forKey: "savedYouOwe2")
        let theyOwe2 = theyOwe2TextField.text!
        UserDefaults.standard.set(theyOwe2, forKey: "savedTheyOwe2")
    }
    
    
    @IBAction func saveButton3(_ sender: UIButton) {
        let name3 = name3TextField.text!
        UserDefaults.standard.set( name3, forKey: "savedName3")
        let youOwe3 = youOwe3TextField.text!
        UserDefaults.standard.set(youOwe3, forKey: "savedYouOwe3")
        let theyOwe3 = theyOwe3TextField.text!
        UserDefaults.standard.set(theyOwe3, forKey: "savedTheyOwe3")
    }
    
    
    
   var addImageNumber = 0
    func pickPhoto()
    {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if(addImageNumber == 1) {imageView1.image = (info[.originalImage] as? UIImage)}
        else if(addImageNumber == 2){
            imageView2.image = (info[.originalImage] as? UIImage)
        }
        else if(addImageNumber == 3){
            imageView3.image = (info[.originalImage] as? UIImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func addImage1Button(_ sender: UIButton) {
        addImageNumber = 1
        pickPhoto()
        
    }
    
    @IBAction func addImageTwoButton(_ sender: UIButton) {
        addImageNumber = 2
        pickPhoto()
       
    }

    
    
    @IBAction func addImageThreeButton(_ sender: UIButton) {
        addImageNumber = 3
        pickPhoto()

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
