//
//  EventTableViewController.swift
//  4006InfoDay2020
//
//  Created by 17214726 on 9/11/2020.
//

import UIKit

class EventTableViewController: UITableViewController {

    var code:String?
    var deptEvents: [Event] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let unwrappedCode = code {
            self.title = unwrappedCode
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        deptEvents = Event.sampleData.filter { $0.dept_id == code }
            
            return deptEvents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = deptEvents[indexPath.row].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let saveAction = self.contextualSaveAction(forRowAtIndexPath: indexPath)
        let swipeConfig = UISwipeActionsConfiguration(actions: [saveAction])

        return swipeConfig
    }
    
    func contextualSaveAction(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Save") {
            (contextAction: UIContextualAction, sourceView: UIView, completionHandler: (Bool) -> Void) in
            
            print("Saving")
            
            let id = self.deptEvents[indexPath.row].id
            
            if let index = Event.sampleData.firstIndex(where: {$0.id == id}) {
                Event.sampleData[index].saved = true
                
                NotificationCenter.default.post(name: Event.didSaveNotification, object: nil)

                let alert = UIAlertController(
                    title: "Event saved to Itinerary!",
                    message: "All saved events are available in the itinerary tab.",
                    preferredStyle: .alert
                )

                alert.addAction(
                    UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        print("OK button pressed!")
                    })
                )

                self.present(alert, animated: true, completion: nil)
            }
            
            completionHandler(true)
        }
        
        return action
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
