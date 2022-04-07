//
//  LogoViews.swift
//  datingApp
//
//  Created by Thien Vu on 07/04/2022.
//

import Foundation
import UIKit

class LogoView : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Can not init the LogoView")
    }
    
    func customLOGO() {
        self.text = "tinder"
        self.textAlignment = .center
        self.textColor = .white
        self.font = .boldSystemFont(ofSize: 30)
        
    }
}

