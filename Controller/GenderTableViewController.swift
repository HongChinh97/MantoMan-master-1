//
//  GenderTableViewController.swift
//  MantoMan
//
//  Created by admin on 1/9/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class GenderTableViewController: UITableViewController {
        var gender = ["Male", "Female"]
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let text = NSMutableAttributedString(string: "What is your Gender?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel
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
        return gender.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.GenderLabel.text = gender[indexPath.row]

        return cell
    }
    
    @IBAction func clickBackDistrict(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    

}
