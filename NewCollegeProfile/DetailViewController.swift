//
//  DetailViewController.swift
//  NewCollegeProfile
//
//  Created by sgolding on 1/22/16.
//  Copyright © 2016 sgolding. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var studentNumber: UITextField!
    
    var college : CollegeClass!

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        collegeTextField.text = college.name
        locationTextField.text = college.location
        studentNumber.text = String(college.numberOfStudents)
        myImageView.image = college.image
    }
    
    
    @IBAction func saveButton(sender: UIButton)
    {
        college.name = collegeTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(studentNumber.text!)!
    }
    

  
    
   
    

}
