//
//  TableViewController.swift
//  msmReports
//
//  Created by Aaron Wong on 12/21/17.
//  Copyright © 2017 Aaron Wong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // for shift start
    @IBAction func startDatePicker(_ sender: Any) {
        let date = DateFormatter();
        date.dateStyle = DateFormatter.Style.short;
        date.timeStyle = DateFormatter.Style.short;
    }
    @IBAction func endDatePicker(_ sender: Any) {
    }
    
    @IBOutlet weak var Label_33: UILabel!
    @IBOutlet weak var Label_52: UILabel!
    @IBOutlet weak var Label_58: UILabel!
    @IBOutlet weak var Label_155: UILabel!
    @IBOutlet weak var Label_251: UILabel!
    @IBOutlet weak var Label_271: UILabel!
    
    @IBOutlet weak var Chair_33: UILabel!
    @IBOutlet weak var Chair_52: UILabel!
    @IBOutlet weak var Chair_54: UILabel!
    @IBOutlet weak var Chair_56: UILabel!
    @IBOutlet weak var Chair_58: UILabel!
    
    @IBOutlet weak var Stand_52: UILabel!
    @IBOutlet weak var Stand_54: UILabel!
    @IBOutlet weak var Stand_56: UILabel!
    @IBOutlet weak var Stand_58: UILabel!
    
    @IBAction func Stepper33_change(_ sender: UIStepper) {Label_33.text = sender.value.description}
    @IBAction func Stepper52_change(_ sender: UIStepper) {Label_52.text = sender.value.description}
    @IBAction func Stepper58_change(_ sender: UIStepper) {Label_58.text = sender.value.description}
    @IBAction func Stepper155_change(_ sender: UIStepper) {Label_155.text = sender.value.description}
    @IBAction func Stepper251_change(_ sender: UIStepper) {Label_251.text = sender.value.description}
    @IBAction func Stepper271_change(_ sender: UIStepper) {Label_271.text = sender.value.description}
    
    @IBAction func Stepper_33_chairs(_ sender: UIStepper) {Chair_33.text = sender.value.description}
    @IBAction func Stepper_52_chairs(_ sender: UIStepper) {Chair_52.text = sender.value.description}
    @IBAction func Stepper_54_chairs(_ sender: UIStepper) {Chair_54.text = sender.value.description}
    @IBAction func Stepper_56_chairs(_ sender: UIStepper) {Chair_56.text = sender.value.description}
    @IBAction func Stepper_58_chairs(_ sender: UIStepper) {Chair_58.text = sender.value.description}
    @IBAction func Stepper_52_stands(_ sender: UIStepper) {Stand_52.text = sender.value.description}
    @IBAction func Stepper_54_stands(_ sender: UIStepper) {Stand_54.text = sender.value.description}
    @IBAction func Stepper_56_stands(_ sender: UIStepper) {Stand_56.text = sender.value.description}
    @IBAction func Stepper_58_stands(_ sender: UIStepper) {Stand_58.text = sender.value.description}
    
    private var showStartDate = false;
    private var showEndDate = false;
    private var showWalkthrough = false;
    private var showPianos = false;
    private var showChairs = false;
    
    private func toggler(cell: Bool) -> Bool {return !cell}
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18;       // make sure to update this continually
    }
    
    // when title row is selected, the startDate bool is flipped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {showStartDate = toggler(cell: showStartDate)}
        else if (indexPath.row == 2) {showEndDate = toggler(cell: showEndDate)}
        else if (indexPath.row == 4) {
            showWalkthrough = toggler(cell:showWalkthrough);
            if (showPianos) {showPianos = toggler(cell: showPianos)};
            if (showChairs) {showChairs = toggler(cell:showChairs)};
        }
        else if (indexPath.row == 5) {showPianos = toggler(cell: showPianos)}
        else if (indexPath.row == 12) {showChairs = toggler(cell:showChairs)}
        tableView.deselectRow(at: indexPath, animated: true);
        tableView.beginUpdates();
        tableView.endUpdates();
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (showStartDate == false && indexPath.row == 1) {return 0}
        else if (showEndDate == false && indexPath.row == 3) {return 0}
        else if (showWalkthrough == false && (indexPath.row == 5 || indexPath.row == 12)) {return 0}
        else if (showPianos == false && (indexPath.row > 5 && indexPath.row < 12)) {return 0}
        else if (showChairs == false && (indexPath.row > 12 && indexPath.row < 18)) {return 0}
        else {
            if (indexPath.row == 1 || indexPath.row == 3) {
                return 218;
            }
            else {
                tableView.rowHeight = UITableViewAutomaticDimension;
                return tableView.rowHeight;
            }
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
