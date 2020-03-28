//
//  makeClubViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/27/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit
import Firebase

class makeClubViewController: UIViewController {
    var ref : DatabaseReference!
    @IBOutlet weak var clubNameField: UITextField!
    
    @IBOutlet weak var signUpLinkField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    func showAlert(message : String){
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        let clubName = clubNameField.text
        let signUpLink = signUpLinkField.text
        let description = descriptionField.text
        
        
        if clubName != "" && signUpLink != "" && description != ""{
            //implement
        }else{
            showAlert(message: "Fill out the form please.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

}
