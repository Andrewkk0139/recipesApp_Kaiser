//
//  ViewController.swift
//  recipesApp_Kaiser
//
//  Created by ANDREW KAISER on 2/15/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase


class ViewController: UIViewController {

    
    @IBOutlet weak var textfieldOutlet: UITextField!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var tableviewOutlet: UITableView!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
    }


}

