//
//  ViewController.swift
//  recipesApp_Kaiser
//
//  Created by ANDREW KAISER on 2/15/24.
//

import UIKit
import FirebaseCore
import FirebaseDatabase


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var textfieldOutlet: UITextField!
    @IBOutlet weak var textViewOutlet: UITextView!
    @IBOutlet weak var tableviewOutlet: UITableView!
    var recipesArray: [Recipes] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        tableviewOutlet.dataSource = self
        tableviewOutlet.delegate = self
        //looking for data changes
        ref.child("Recipes").observeSingleEvent(of: .value) { snapshot in
            let dict = snapshot.value as! [String:String]
            let r = Recipes(dict: dict)
            r.firebaseKey = snapshot.key
            self.recipesArray.append(r)
        }
        ref.child("Recipes").observeSingleEvent(of: .value, with: { snapshot in
                print("--inital load has completed and the last user was read--")
                print(self.recipesArray.count)
            })
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        let tempTitle = textfieldOutlet.text!
        let tempSteps = textViewOutlet.text!
        let r = Recipes(title: tempTitle, steps: tempSteps)
        r.saveToFirebase()
    }
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = "\(recipesArray[indexPath.row].title)"
        return cell
    }
}

