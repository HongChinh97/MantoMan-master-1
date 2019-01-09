//
//  CustomBtn.swift
//  MantoMan
//
//  Created by Duc Anh on 1/8/19.
//  Copyright © 2019 SonTocDai. All rights reserved.
//

import UIKit
@IBDesignable
class CustomBtn: UIButton {
@IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
    didSet {
        setLayout()
    }
    }
    
    func setLayout() {
        if cornerRadius == -1 {
            layer.cornerRadius = frame.height*0.5
        } else {
            layer.cornerRadius = cornerRadius
        }
    }

}

@IBDesignable
class CustomLabel: UILabel {
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            setLayout()
        }
    }
    
    func setLayout() {
        if cornerRadius == -1 {
            layer.cornerRadius = 10
        } else {
            layer.cornerRadius = cornerRadius
        }
    }
    
}
