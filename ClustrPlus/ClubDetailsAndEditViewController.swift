//
//  ClubDetailsAndEditViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/29/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit
import Firebase

class ClubDetailsAndEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var events: [Event] = []
    var ref: DatabaseReference!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        
        return cell
    }
    
    var club: Club!
    var scheduleState = true
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubLink: UILabel!
    
    @IBOutlet weak var updateB: UIButton!
    @IBOutlet weak var scheduleB: UIButton!
    
    @IBOutlet weak var clubDescription: UITextView!
    
    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        clubName.text = club.name
        clubLink.text = club.signUpLink
        clubDescription.text = club.description
        tableView.dataSource = self
        tableView.delegate = self
        let newEvent = #imageLiteral(resourceName: "New Schedule")
        newButton.setImage(newEvent, for: .normal)
        
    }
    
    @IBAction func schedulePress () {
        if scheduleState == false {
            let SD = #imageLiteral(resourceName: "Schedule Selected")
            let UL = #imageLiteral(resourceName: "Updates Unselected")
            scheduleB.setImage(SD, for: .normal)
            updateB.setImage(UL, for: .normal)
            scheduleState = true
            let newEvent = #imageLiteral(resourceName: "New Schedule")
            newButton.setImage(newEvent, for: .normal)
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
            let newUpdate = #imageLiteral(resourceName: "New Update")
            newButton.setImage(newUpdate, for: .normal)
            
            // add code for displaying schedule page here
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewEventSegue"  {
              let newEvent = segue.destination as? CreateNewEventViewController
            newEvent?.clubId = club.clubId
          }
        else if segue.identifier == "toEdit"{
            let editEvent = segue.destination  as? EditClubViewController
            editEvent!.club = self.club
        }
      }

    


}
