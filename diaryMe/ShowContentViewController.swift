//
//  ShowContentViewController.swift
//  diaryMe
//
//  Created by Kyle Nguyen on 6/5/17.
//  Copyright © 2017 Kyle Nguyen. All rights reserved.
//

import UIKit
import Foundation

/*
 Set controller for the labels
 */
class ShowContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set content of the two label in newEntryView
        titleLabel.text = listEntry[selectedRow].getTitleEntry()
        contentLabel.text = listEntry[selectedRow].getContent()
    }

}
