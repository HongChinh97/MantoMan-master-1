//
//  Cities.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class Cities {
    var CityCode: Int
    var Name: String
    
    init?(dict: JSON) {
        guard let Name = dict["Name"] as? String else {return nil}
        guard let CityCode = dict["CityCode"] as? Int else {return nil}
        self.Name = Name
        self.CityCode = CityCode
    }
    
}
