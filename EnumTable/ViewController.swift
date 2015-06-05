//
//  ViewController.swift
//  EnumTable
//
//  Created by Bart Whiteley on 6/5/15.
//  Copyright (c) 2015 whiteley.org. All rights reserved.
//

import UIKit

extension Row {
    var reuseIdentifier:String {
        return "cell"
    }
}


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }


    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.schema[section].rows.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewModel.schema.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = self.viewModel.schema[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(row.reuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
        cell.imageView?.image = row.icon
        cell.textLabel?.text = row.displayName
        cell.accessoryType = row.URL == nil ? .None : .DisclosureIndicator
        cell.selectionStyle = row.URL == nil ? .None : .Gray
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel.schema[section].sectionTitle
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = self.viewModel.schema[indexPath.section].rows[indexPath.row]
        if let stringURL = row.URL {
            if let url = NSURL(string: stringURL) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }

}

