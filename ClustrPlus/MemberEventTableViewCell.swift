//
//  MemberEventTableViewCell.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 4/9/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class MemberEventTableViewCell: UITableViewCell {

    var indexPath: IndexPath!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Location: UILabel!
    
    @IBOutlet weak var Description: UITextView!
}
