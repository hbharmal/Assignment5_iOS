//
//  AnimalTableViewController.swift
//  nht278_assignment5
//
//  Created by Nancy Tran on 10/5/18.
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
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animals.count * 2
    }

    var counter = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        //let cell2 = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
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
    
/*
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Animals"
//    }
*/
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = 80;
        return height
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
