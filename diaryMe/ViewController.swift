//
//  ViewController.swift
//  diaryMe
//
//  Created by Kyle Nguyen on 4/10/17.
//  Copyright © 2017 Kyle Nguyen. All rights reserved.
//

import UIKit
import Firebase

var ref: DatabaseReference!
let userID = "Default"
var listEntry:Array<EntryDiary> = Array<EntryDiary>()
var selectedRow = Int()

/*
 This class is the controller for the main screen view -
 */
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var entryTable: UITableView!
    var databaseHandle:DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Define Referrence to Firebase
        ref = Database.database().reference()
        //initial tableview
        entryTable.delegate = self
        entryTable.dataSource = self
        //Set refference to the entry table
        let entryTableRef = ref.child("Users").child(userID)
        //call method retrieve data
        retrieveData(entryTableRef: entryTableRef)
    }
    //define number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return listEntry.count
    }
    //define cell in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = entryTable.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath as IndexPath) as!EntryTableCell
        cell.cellLabel.text = listEntry[indexPath.row].getTitleEntry()
        return cell
    }
    //what to do when row is select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    //able to delete function
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            entryTable.beginUpdates()
            ref.child("Users").child(userID).child(listEntry[indexPath.row].getID()).removeValue()
            listEntry.remove(at: indexPath.row)
            entryTable.deleteRows(at: [indexPath],  with: .automatic)
            entryTable.endUpdates()
        }
    }
    //retrieve the data from Firebase database
    func retrieveData(entryTableRef:DatabaseReference) {
        databaseHandle = entryTableRef.observe(.childAdded, with: { (snapshot) in
            //get the snapshot
            let entry = snapshot.value as? [String: AnyObject]
            if(entry != nil){
                //add Data to the array
                let loadedContent:String = (entry?["content"] as! String)
                let loadedTitle:String = (entry?["title"] as! String)
                let loadedID:String = (entry?["id"] as! String)
                let loadedTimestampe:Int=(entry?["created"] as! Int)
                let entryDiary:EntryDiary = EntryDiary(titleEntryS:loadedTitle, contentS:loadedContent, idS:loadedID, timestampeS: loadedTimestampe)
                self.checkDucplicatedData(entryDiary: entryDiary)
                }})}
    //check if the table loaded data is duplicated or not
    func checkDucplicatedData(entryDiary:EntryDiary){
        if(listEntry.count == 0){
            listEntry.append(entryDiary)
            self.entryTable.reloadData()
        } else if((listEntry.last?.getTimeStampe())! < entryDiary.getTimeStampe()) {
            listEntry.append(entryDiary)
            self.entryTable.reloadData()
        }
    }
    
}


