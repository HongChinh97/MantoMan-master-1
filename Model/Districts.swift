//
//  District.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

class Districts {
    var CityCode: Int
    var DistrictCode: Int
    var Name: String
    
    init?(dict: JSON) {
        guard let CityCode = dict["CityCode"] as? Int else {return nil}
        guard let DistrictCode = dict["DistrictCode"] as? Int else {return nil}
        guard let Name = dict["Name"] as? String else {return nil}
        self.CityCode = CityCode
        self.DistrictCode =  DistrictCode
        self.Name = Name
    }
    
}
