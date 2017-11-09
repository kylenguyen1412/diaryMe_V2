//
//  Entry.swift
//  
//
//  Created by Kyle Nguyen on 6/5/17.
//
//

import Foundation
import CoreData
/*
 This class is the model for entry database
 */
struct EntryDiary
{
    //title of entry
    let titleEntry : String!
    //content of entry
    let content: String!
    //timestampe of the entry
    let timestampe: Int!
    //identification number of the entry
    let id: String!
    
    init(titleEntryS:String, contentS:String, idS:String, timestampeS:Int) {
        titleEntry = titleEntryS
        content = contentS
        id = idS
        timestampe = timestampeS
    }
    
    func getTitleEntry() -> String{
        return titleEntry
    }
    func getContent() -> String{
        return content
    }
    func getTimeStampe() -> Int{
        return timestampe
    }
    func getID() -> String{
        return id
    }
}
