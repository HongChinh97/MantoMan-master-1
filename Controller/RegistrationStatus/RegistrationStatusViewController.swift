//
//  RegistrationStatusViewController.swift
//  MantoMan
//
//  Created by admin on 1/10/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class RegistrationStatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableVIew: UITableView!
    var arrString = ["Không xác định muộn", "Công văn đã đăng ký", "Tuyển dụng đã đăng ký"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        tableVIew.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.937254902, blue: 0.8352941176, alpha: 1)
        tableVIew.rowHeight = 90
        tableVIew.separatorStyle = .none

        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedStringKey.font: titleLabel.font, NSAttributedStringKey.paragraphStyle: paragraphStype] as [NSAttributedStringKey : Any]
        let text = NSMutableAttributedString(string: "Please let me know ManToMan registration status?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableVIew.tableHeaderView = titleLabel
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return arrString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! RegistrationStatusTableViewCell
        cell.registrationStatusLabel.text = arrString[indexPath.row]
        return cell
    }
    
    @IBAction func clickBackAge(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
