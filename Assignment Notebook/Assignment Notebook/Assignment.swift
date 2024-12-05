//
//  Assignment.swift
//  Assignment Notebook
//
//  Created by Rabinowitz, Jordyn on 3/16/22.
//

import UIKit

class assignment{
    
    var className: String
    var assignmentName: String
    var dueDay: String
    
    init(Class:String, AssignmentName:String, due:String){
        className = Class
        assignmentName = AssignmentName
        dueDay = due
    }
}

var assignmentList: [assignment] = []
