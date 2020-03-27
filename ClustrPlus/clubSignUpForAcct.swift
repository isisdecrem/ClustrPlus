//
//  clubSignUpForAcct.swift
//  ClustrPlus
//
//  Created by Isis Decrem on 3/22/20.
//  Copyright © 2020 Isis Decrem. All rights reserved.
//

import UIKit
import Firebase

class clubSignUpForAcct: UIViewController, UITextFieldDelegate {
    
    var emailText : String = "";
    var pwText : String = "";

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
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
    
    @IBAction func signUpButton(_ sender: Any) {
        emailText = emailField.text!
        pwText = pwField.text!
        Auth.auth().createUser(withEmail: emailText, password: pwText)
        { (user, error) in
            if (error == nil)
            {
                self.alertShowMethod(title: "Success!", message: "You have successfully registered on Clustr")
            }
        }
    }
    
    func alertShowMethod(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
