//
//  EditClubViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 4/1/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit
import Firebase

class EditClubViewController: UIViewController {
    var club: Club?
    var ref: DatabaseReference!
    var oldName: String = ""
    var oldDescription: String = ""
    var oldLink: String = ""
    
    @IBOutlet weak var clubName: UITextField!
    
    
    @IBOutlet weak var clubLink: UITextField!
    
    
    @IBOutlet weak var clubDescription: UITextView!
    
    func showAlert(message : String, title : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        let newName = clubName.text
        let newLink = clubLink.text
        let newDescription = clubDescription.text
        print(oldName)
        print(newName)

        if newName != "" && newLink != "" && newDescription != ""{
            if newName != oldName || newDescription != oldDescription || newLink != oldLink {
                ref.child("Clubs").observeSingleEvent(of: .value, with: {
                    snapshot in
                    for child in snapshot.children{
                        if let snapshot = child as? DataSnapshot,
                            let clubItem = Club(snapshot: snapshot){
                            if self.club?.clubId == clubItem.clubId{
                                self.ref.child("Clubs").child(snapshot.key).setValue([ "Club Id" : self.club!.clubId, "Id" : self.club!.id
                                    ,"Club Name" : newName!, "Club Description" : newDescription!, "Club Sign Up Link" : newLink!])
                                break
                            }
                        }
                    }
                })
            }
        }
        else {
            showAlert(message: "fill out all fields", title: "Error")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        oldName = club?.name as! String
        oldLink = club?.signUpLink as! String
        oldDescription = club?.description as! String
        clubName.text = oldName
        clubLink.text = oldLink
        clubDescription.text = oldDescription
        ref = Database.database().reference()
    }
    



}
