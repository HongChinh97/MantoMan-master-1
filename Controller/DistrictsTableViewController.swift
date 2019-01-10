//
//  DistrictsTableViewController.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class DistrictsTableViewController: UITableViewController {
    var cityCode : Int?
    var selectedCity = GetDataFromPlist.sharedInstant.districts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCity = selectedCity.filter({ (data) -> Bool in
            return data.CityCode == cityCode
            
        })
        tableView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.9215686275, blue: 0.8039215686, alpha: 1)
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
        return selectedCity.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        
        cell.districtsLabel.text = selectedCity[indexPath.row].Name
        
        return cell
    }
    
    @IBAction func clickBack(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clickNextGender(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "PushGender") as! GenderTableViewController
        //        self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
