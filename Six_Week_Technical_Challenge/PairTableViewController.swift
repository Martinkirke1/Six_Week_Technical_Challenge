//
//  PairTableViewController.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            }
    
    var pair: Pair?

    @IBAction func addPairTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        var textfield: UITextField?

        alert.addTextField { (newTextField) in
            textfield = newTextField
        }
        
        let addPerson = UIAlertAction(title: "Add", style: .default) { (_) in
            
            guard let PersonText = textfield?.text else { return }
            PairController.shared.addPerson(add: PersonText)
            
                self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)

        alert.addAction(addPerson)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PairController.shared.pairs.count
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Group"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PairCell", for: indexPath)

        let pair = PairController.shared.pairs[indexPath.row]
        cell.textLabel?.text = pair.name
        
        
        return cell
    }
    

   
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

   }
