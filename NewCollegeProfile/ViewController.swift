//
//  ViewController.swift
//  NewCollegeProfile
//
//  Created by sgolding on 1/21/16.
//  Copyright © 2016 sgolding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editbutton: UIBarButtonItem!
    var colleges : [CollegeClass] = []
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        editbutton.tag = 0
        
        
        
       colleges.append(CollegeClass(Name: "Purdue University", Location: "West Lafayette, Indiana", NumberOfStudents: 38770, Image: UIImage(named: "purdue.png")!))
        colleges.append(CollegeClass(Name: "Marquette University", Location: "Milwaukee, Wisconsin", NumberOfStudents: 11745, Image: UIImage(named: "marquette.png")!))
        colleges.append(CollegeClass(Name: "University of Michigan", Location: "Ann Arbor", NumberOfStudents: 43651, Image: UIImage(named: "default")!))
    
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel?.text = colleges[indexPath.row].name
        return myCell
    }
    
    
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
     if editbutton.tag == 0
     {
        myTableView.editing = true
        editbutton.tag = 1
        }
        else
     {
        myTableView.editing = false
        editbutton.tag = 0
        }
        
        
    }
    
    @IBAction func addButton(sender: UIBarButtonItem)
    {
     let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (collegeTextField) -> Void in collegeTextField.placeholder = "Add College Name"
        }
        
            myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in locationTextField.placeholder = "Add Location"
            }
        
    }
    
    
    
    



}
