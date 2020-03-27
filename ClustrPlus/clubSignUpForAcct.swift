//
//  clubSignUpForAcct.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/22/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit

class clubSignUpForAcct: UIViewController, UITextFieldDelegate {
    
    //outlet for user entered email
    @IBOutlet weak var emailAdd: UITextField!
    //outlet for user entered pw
    @IBOutlet weak var password: UITextField!
    
    //outlet for user entered confirmed pass
    @IBOutlet weak var confirmedPassword: UITextField!
    
    //action for when sign up is pressed
    @IBAction func signUpPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func close() {
           dismiss(animated: true, completion: nil)
       }
    

}
