//
//  ycsClubDefaultPage.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/24/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit




class ycsClubDefaultPage: UIViewController {
    
    @IBOutlet weak var scheduleB: UIButton!
    @IBOutlet weak var updateB: UIButton!
    @IBOutlet weak var updateStack: UIStackView!
    
    var scheduleState: Bool = true
    
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateStack.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func schedulePress(){
        if scheduleState == false {
            let scheduleHighlighted = #imageLiteral(resourceName: "Schedule Selected")
            let updateNormal = #imageLiteral(resourceName: "Updates Unselected")
            scheduleB.setImage(scheduleHighlighted, for: .normal)
            updateB.setImage(updateNormal, for: .normal)
            scheduleState = true
            updateStack.isHidden = true
        }
    }
    
    @IBAction func updatePress(){
        if scheduleState == true {
            let updateHighlighted = #imageLiteral(resourceName: "Updates Selected")
            let scheduleNormal = #imageLiteral(resourceName: "Updates Unselected")
            scheduleB.setImage(scheduleNormal, for: .normal)
            updateB.setImage(updateHighlighted, for: .normal)
            scheduleState = false
            updateStack.isHidden = false

        }
    }
   
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
