//
//  AddViewController.swift
//  Assignment Notebook
//
//  Created by Rabinowitz, Jordyn on 3/17/22.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var classTextField: UITextField!
    
    @IBOutlet weak var assignmentTextField: UITextField!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addAssignmentButton(_ sender: UIButton) {
       
        let className = classTextField.text!
        

        let assignmentName = assignmentTextField.text!
        

        let dueDate = dueDatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let formattedDate = dateFormatter.string(from: dueDate)
        
       
         
        let newAssignment = assignment(Class: className, AssignmentName: assignmentName, due: formattedDate)

        assignmentList.append(newAssignment)
        
        if let notebookVC = presentingViewController?.children.first as? NotebookTableViewController {
            notebookVC.tableView.reloadData()
            dismiss(animated: true, completion: nil)
        }
        
         
    }
    
    @IBAction func cancelAddButton(_ sender: UIButton) {
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
