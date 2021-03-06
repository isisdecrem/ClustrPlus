//
//  MemberClubViewerViewController.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/30/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit
import Firebase

class MemberClubViewerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var events: [Event] = []
    var updates: [Update] = []
    var ref: DatabaseReference!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        if scheduleState == true {
            print(events.count)
            return events.count
        } else{
            return updates.count
        }
            
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! MemberEventTableViewCell
        if scheduleState == true {
                cell.title.text = events[indexPath.section].title
                cell.Time.text = events[indexPath.section].time
                cell.Date.text = events[indexPath.section].date
                cell.Location.text = events[indexPath.section].location
                cell.Description.text = events[indexPath.section].extra
                cell.Description.isEditable = false
                cell.indexPath = indexPath
          }else{
        
              cell.title.text = updates[indexPath.section].title
              cell.Description.text = updates[indexPath.section].update
              cell.Time.isHidden = true
              cell.Location.isHidden = true
              cell.Date.isHidden = true
              cell.indexPath = indexPath
          }
            
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
    
    
   func loadEvent(){
       ref.child("Events").queryOrdered(byChild: "Event Title").observe(.value, with: { snapshot
           in
           var newEvents: [Event] = []
           for child in snapshot.children{
               if let snapshot = child as? DataSnapshot,
               let event = Event(snapshot: snapshot){
                   if  event.clubId == self.club.clubId{
                       print("New event added")
                       newEvents.append(event)
                   }
               }
           }
           
           self.events = newEvents
           self.tableView.reloadData()
       })
   }
   
   func loadUpdates(){
       ref.child("Updates").queryOrdered(byChild: "Update Title").observe(.value, with: { snapshot
           in
           var newUpdates: [Update] = []
           for child in snapshot.children{
               if let snapshot = child as? DataSnapshot,
               let update = Update(snapshot: snapshot){
                   if  update.clubId == self.club.clubId{
                       print("New update posted")
                       newUpdates.append(update)
                   }
               }
           }
           
           self.updates = newUpdates
           self.tableView.reloadData()
       })
   }
   
   
   override func viewDidLoad() {
       super.viewDidLoad()
       ref = Database.database().reference()
       clubName.text = club.name
       clubLink.text = club.signUpLink
       clubDescription.text = club.description
       tableView.dataSource = self
       tableView.delegate = self
       tableView.rowHeight = UITableView.automaticDimension
       tableView.estimatedRowHeight = 500
       let newEvent = #imageLiteral(resourceName: "New Schedule")
       
       
       if scheduleState == true {
           loadEvent()
       } else {
           loadUpdates()
       }
   }
    
    @IBAction func schedulePress () {
        if scheduleState == false {
            let SD = #imageLiteral(resourceName: "Schedule Selected")
            let UL = #imageLiteral(resourceName: "Updates Unselected")
            updateB.setImage(UL, for: .normal)
            scheduleB.setImage(SD, for: .normal)
            scheduleState = true
            loadEvent()
        }
    }
    
    @IBAction func updatePress(){
        if scheduleState {
            let SL = #imageLiteral(resourceName: "Schedule Unselected")
            let UD = #imageLiteral(resourceName: "Updates Selected")
             updateB.setImage(UD, for: .normal)
            scheduleB.setImage(SL, for: .normal)
            scheduleState = false
            loadUpdates()
            
        }
    }
    



}
