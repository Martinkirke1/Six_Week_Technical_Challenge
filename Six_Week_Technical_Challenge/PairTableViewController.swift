//
//  PairTableViewController.swift
//  Six_Week_Technical_Challenge
//
//  Created by Martin Kirke on 12/2/16.
//  Copyright © 2016 Ghost. All rights reserved.
//

import UIKit
import GameKit

class PairTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Actions

    @IBAction func randomButtonPressed(_ sender: Any) {
        
       let new = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: PairController.shared.persons)
        print(new)
        PairController.shared.random()
        tableView.reloadData()

    }
    @IBAction func addButtonPressed(_ sender: Any) {
    
    
        let alert = UIAlertController(title: "Name", message: nil, preferredStyle: .alert)
        var nameTextField = UITextField()
        
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
            nameTextField = textField
        }
        
        let add = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let Name = nameTextField.text else { return }
            PairController.shared.addPerson(Name: Name)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (PairController.shared.persons.count)/2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (PairController.shared.persons.count % 2 != 0) {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PairCell", for: indexPath)
        let person = PairController.shared.persons[(indexPath.section * 2)]
        cell.textLabel?.text = person.Name
        
        return cell
    }
}


