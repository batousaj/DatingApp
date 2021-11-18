//
//  ActionUtil.swift
//  datingApp
//
//  Created by Vu Thien on 18/11/2021.
//

import Foundation
import UIKit

class ActionUtilities : NSObject {
    
    var shareInstance:ActionUtilities?
    
    func getInstance() {
        shareInstance! = ActionUtilities.init()
        
    }
    
    func utilButtonWhiteView (_ buttionView : UIButton ,_ backgroundColor : UIColor ) {
        let buttonLayer = CALayer()
        
        buttonLayer.borderColor = UIColor.white.cgColor
        buttonLayer.cornerRadius = 5
        
        buttionView.backgroundColor = backgroundColor
        
        buttionView.layer.addSublayer(buttonLayer)
        
    }
    
    func utilLabelView(_ labelView: UILabel,_ backgroundColor : UIColor ) {
        
        let labelLayer = CALayer()
        
        labelLayer.borderColor = UIColor.gray.cgColor
        labelLayer.cornerRadius = 5
        
        labelView.backgroundColor = backgroundColor
        
        labelView.layer.addSublayer(labelLayer)
    }
    
    func utilTextfieldView(_ textView: UITextField,_ backgroundColor : UIColor ) {
        
        let textLayer = CALayer()
        
        textLayer.borderColor = UIColor.gray.cgColor
        textLayer.cornerRadius = 5
        
        textView.backgroundColor = backgroundColor
            
        textView.layer.addSublayer(textLayer)
    }
    
}
