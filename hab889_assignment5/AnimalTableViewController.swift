//
//  AnimalTableViewController.swift
//  hab889_assignment5
//
//  Created by Hussain Bharmal on 10/5/18.
//  Copyright © 2018 cs329e. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {

    var animals = [Animal(name: "Giraffe", scientific: "Giraffa", classification: "Mammalia", size: "1800 lbs", image: "giraffe"),
                
                   Animal(name: "Panda", scientific: "Ailuropoda Melanoleuca", classification: "Mammalia", size: "200 lbs", image: "panda"),
                
                   Animal(name: "Koala", scientific: "Phascolarctos Cinereus", classification: "Mammalia", size: "30 lbs", image: "koala"),
             
                   Animal(name: "Sloth", scientific: "Folivora", classification: "Mammalia", size: "12 lbs", image: "sloth" )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Animals"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count * 2
    }

    var counter = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var animal: Animal = animals[0]
        if (indexPath.row == 0 || indexPath.row == 1) {
            animal = animals[0]
        } else if (indexPath.row == 2 || indexPath.row == 3) {
            animal = animals[1]
        } else if (indexPath.row == 4 || indexPath.row == 5) {
            animal = animals[2]
        } else if (indexPath.row == 6 || indexPath.row == 7) {
            animal = animals[3]
        }
        
        if (indexPath.row % 2 == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
            cell.imageView?.image = UIImage(named: animal.image)
            cell.textLabel?.text = animal.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Scientific Name:     \(animal.scientific) \n                  Class:     \(animal.classification) \n               Weight:      \(animal.size)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 80;
        return height
    }

}
