//
//  College.swift
//  NewCollegeProfile
//
//  Created by sgolding on 1/21/16.
//  Copyright © 2016 sgolding. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    

    init(Name: String, Location: String, NumberOfStudents: Int, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
        
    }
    
    
    
    
    
    
    
    
    

}
