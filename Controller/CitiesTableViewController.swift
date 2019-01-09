//
//  CitiesTableViewController.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetDataFromPlist.sharedInstant.loadData { [unowned self] in
            self.tableView.reloadData()
        }
        tableView.backgroundColor = UIColor.lightGray
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedStringKey.font: titleLabel.font, NSAttributedStringKey.paragraphStyle: paragraphStype] as [NSAttributedStringKey : Any]
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GetDataFromPlist.sharedInstant.cities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.citiesLabel.text = GetDataFromPlist.sharedInstant.cities[indexPath.row].Name

        return cell
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexpath = tableView.indexPathForSelectedRow {
            if let bucket = segue.destination as? DistrictsTableViewController {
                bucket.cityCode = GetDataFromPlist.sharedInstant.cities[indexpath.row].CityCode
                
            }
        }
    }

    @IBAction func clickBackStart(_ sender: UIBarButtonItem) {
//        navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
}
