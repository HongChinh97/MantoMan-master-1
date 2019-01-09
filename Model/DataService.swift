//
//  DataService.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit

typealias JSON = Dictionary<AnyHashable, Any>

class GetDataFromPlist {
    static var sharedInstant = GetDataFromPlist()
    
    var cities: [Cities] = []
    var districts: [Districts] = []
    var arrFilter: [Districts] = []
    
    var selectedCity: Cities? {
        didSet {
            if selectedCity != nil {
                arrFilter = districts.filter({ (data) -> Bool in
                    data.CityCode == selectedCity!.CityCode
                })
            }
        }
    }
    
    func loadData(completeHandler: () -> Void) {
        loadCities(completeHandler: completeHandler)
        loadDistricts()
    }
    
    func loadDistricts() {
        guard  let dict = PlistServices().getDictionaryFrom(plist: "Districts.plist")   else {return}
        guard let districtsDictionaryArray = dict["Districts"] as? [JSON] else {return}
        for dict in districtsDictionaryArray {
            if let district = Districts(dict: dict) {
                districts.append(district)
            }
        }
        
    }
    
    func loadCities(completeHandler: () -> Void) {
        guard let city = PlistServices().getDictionaryFrom(plist: "Cities.plist") else {return}
        guard let citiesDictionaryArray = city["Cities"] as? [JSON] else {return}
        for cit in citiesDictionaryArray {
            if let city = Cities(dict: cit) {
                cities.append(city)
            }
        }
        completeHandler()
    }
    
}
