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
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubLink: UILabel!
    
    @IBOutlet weak var clubDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubName.text = club.name
        clubLink.text = club.signUpLink
        clubDescription.text = club.description
        
    }
    


}
