//
//  ViewController.swift
//  TableViewPractice
//
//  Created by NY on 2024/2/1.
//
// MARK: - 1.

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 10 : 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowCell", for: indexPath)
        
        cell.textLabel?.text = "This is section \(indexPath.section), row \(indexPath.row)"
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


//MARK: - 2.
/*:
 After reloadData() is called, the system will initiate a series of calls to the UITableViewDataSource methods:
 
 1. Number of sections in the table view:
    func numberOfSections(in: UITableView) -> Int
 
 2. Number of rows in the section (Required method):
    func tableView(UITableView, numberOfRowsInSection: Int) -> Int
 
 3. The configuration of the cell (Required method):
    func tableView(UITableView, cellForRowAt: IndexPath) -> UITableViewCell
 
 4. Title of the header or footer of the specified section:
    func tableView(UITableView, titleForHeaderInSection: Int) -> String?
    func tableView(UITableView, titleForFooterInSection: Int) -> String?
 
 - reloadData(): the entire table view is refreshed, and all visible cells are replaced with the newly configured cells from the data source. The sequence and methods which will be called depends on the exact changes in your data.
 
 - Besides UITableViewDataSource protocol, methods of UITableViewDelegate protocol can also be called with reloadData(). However, reloadData() shouldn’t be called in the methods that insert or delete rows, since it may impact performance such as animation loss.
 
 */
