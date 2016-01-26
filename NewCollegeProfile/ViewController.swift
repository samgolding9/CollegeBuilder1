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
        myAlert.addTextFieldWithConfigurationHandler { (studentNumber) -> Void in
                studentNumber.placeholder = "Add Population"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style:  UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            
            let collegesTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let populationTF = myAlert.textFields![2]
            //self.colleges.append(CollegeClass(Name: collegesTF.text!, Location: locationTF.text!, Population: populationTF.text!)))
            self.myTableView.reloadData()
        }
        
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion:  nil)
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
        
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectRow!]
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



}
