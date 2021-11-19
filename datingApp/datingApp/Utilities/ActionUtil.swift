//
//  ActionUtil.swift
//  datingApp
//
//  Created by Vu Thien on 18/11/2021.
//

import Foundation
import UIKit

class ActionUtilities : NSObject {
    
    static func styleButtonView (_ buttionView : UIButton ,_ backgroundColor : UIColor ) {
        
        buttionView.backgroundColor = backgroundColor
        buttionView.layer.borderWidth = 1

        buttionView.layer.cornerRadius = 25.0
        buttionView.tintColor = UIColor.white
        
    }
    
    static func styleLabelView(_ labelView: UILabel,_ backgroundColor : UIColor ) {
        
        labelView.backgroundColor = backgroundColor
        labelView.layer.borderColor = UIColor.green.cgColor
        labelView.layer.borderWidth = 1

        labelView.layer.cornerRadius = 25.0
        labelView.tintColor = UIColor.white
    }
    
    static func styleTextField(_ textfield:UITextField) {
        
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.gray.cgColor
        
    }
    
}
