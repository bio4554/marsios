//
//  ClassTableViewController.swift
//  Mars
//
//  Created by Austin Childress on 8/12/16.
//  Copyright © 2016 Mars Dev. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    
    // MARK: Properties
    
    @IBOutlet var tableViewWork: UITableView!
    var classes = [Class]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let savedClasses = loadClasses() {
            classes += savedClasses
        } else {
        
            loadSampleClasses()
            
        }
        
        sortAndRefresh()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func sortAndRefresh() {
        classes.sort(by: { $0.level > $1.level })
        tableViewWork.reloadData()
    }
    
    func loadSampleClasses() {
       /* let class1 = Class(namet: "Homework 1", levelt: 1, iclasst: "English")
        let class2 = Class(namet: "Homework 2", levelt: 2, iclasst: "Science")
        let class3 = Class(namet: "Homework 3", levelt: 3, iclasst: "Art")
        
        classes += [class1, class2, class3]
        */
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ClassTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ClassTableViewCell
        let classt = classes[indexPath.row]
    
        
        cell.classNameLabel.text = classt.name
        cell.classClassLabel.text = classt.iclass + " - " + classt.date
        cell.classLevelLabel.text = String(classt.level)

        return cell
    }
    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as?
            ClassViewController, let nclass = sourceViewController.nclass {
            let newIndexPath = NSIndexPath(row: classes.count, section: 0)
            classes.append(nclass)
            tableView.insertRows(at: [newIndexPath as IndexPath], with: .bottom)
            saveClasses()
            sortAndRefresh()
        }
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            classes.remove(at: indexPath.row)
            saveClasses()
            tableView.deleteRows(at: [indexPath], with: .fade)
            sortAndRefresh()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let classDetailViewController = segue.destination as! ClassViewController
            // Get the cell that generated this segue.
            if let selectedClassCell = sender as? ClassTableViewCell {
                let indexPath = tableView.indexPath(for: selectedClassCell)!
                let selectedMeal = classes[indexPath.row]
                classDetailViewController.nclass = selectedMeal
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
    // MARK: NSCoding
    
    func saveClasses() {
        let isSuccesfulSave = NSKeyedArchiver.archiveRootObject(classes, toFile: Class.ArchiveURL.path)
        if !isSuccesfulSave {
            print("Failed to save classes...")
        }
    }
    
    func loadClasses() -> [Class]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Class.ArchiveURL.path) as? [Class]
    }
 

}
