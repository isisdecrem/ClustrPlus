//
//  ClubDetailsAndEditViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/29/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class ClubDetailsAndEditViewController: UIViewController {
    var club: Club!
    var scheduleState = true
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubLink: UILabel!
    
    @IBOutlet weak var updateB: UIButton!
    @IBOutlet weak var scheduleB: UIButton!
    
    @IBOutlet weak var clubDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubName.text = club.name
        clubLink.text = club.signUpLink
        clubDescription.text = club.description
        
    }
    
    @IBAction func schedulePress () {
        if scheduleState == false {
            let SD = #imageLiteral(resourceName: "Schedule Selected")
            let UL = #imageLiteral(resourceName: "Updates Unselected")
            scheduleB.setImage(SD, for: .normal)
            updateB.setImage(UL, for: .normal)
            scheduleState = true
            
            // Add code for displaying updates page here
        }
    }
    
    @IBAction func updatePress(){
        if scheduleState {
            let SL = #imageLiteral(resourceName: "Schedule Unselected")
            let UD = #imageLiteral(resourceName: "Updates Selected")
            scheduleB.setImage(SL, for: .normal)
            updateB.setImage(UD, for: .normal)
            scheduleState = false
            
            // add code for displaying schedule page here
        }
    }
    


}
