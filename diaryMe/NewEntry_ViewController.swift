//
//  NewEntry_ViewController.swift
//  diaryMe
//
//  Created by Kyle Nguyen on 5/29/17.
//  Copyright © 2017 Kyle Nguyen. All rights reserved.
//

import UIKit
import Firebase

/*
 Controller for newEntryView
 */
class NewEntry_ViewController: UIViewController {

    @IBOutlet weak var diaryTitle_textview: UITextField!
    @IBOutlet weak var diaryContent_textview: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    var exchangeData:UserDefaults!
    
    //Set action for the DONE button
    @IBAction func SaveEntry(_ sender: Any) {
        //set referrence for new entry
        var thisRef = ref.child("Users").child(userID).childByAutoId()
        //collect data from the view
        let entry = ["title": diaryTitle_textview.text!,"content": diaryContent_textview.text!,"created": ServerValue.timestamp(), "id": thisRef.key] as [String : Any]
        //set value to Firebase
        thisRef.setValue(entry)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    

}
