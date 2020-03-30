//
//  ClubDetailsAndEditViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/29/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class ClubDetailsAndEditViewController: UIViewController {
    
    var scheduleState = true
    var club: Club!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubLink: UILabel!
    @IBOutlet weak var clubDescription: UITextView!
    
    @IBOutlet weak var scheduleB: UIButton!
    @IBOutlet weak var updateB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubName.text = club.name
        clubLink.text = club.signUpLink
        clubDescription.text = club.description
        
    }
    
    @IBAction func schedulePress() {
        if scheduleState == false {
            let scheduleDark = #imageLiteral(resourceName: "Schedule Selected")
            let updateLight = #imageLiteral(resourceName: "Updates Unselected")
            updateB.setImage(updateLight, for: .normal)
            scheduleB.setImage(scheduleDark, for: .normal)
            scheduleState = true
            
            //Add code for displaying the update menu here!
        }
    }
    
    @IBAction func updatePress() {
        if scheduleState == true{
            let scheduleLight = #imageLiteral(resourceName: "Schedule Unselected")
            let updateDark = #imageLiteral(resourceName: "Updates Selected")
            updateB.setImage(updateDark, for: .normal)
            scheduleB.setImage(scheduleLight, for: .normal)
            scheduleState = false
        }
    }
    


}
