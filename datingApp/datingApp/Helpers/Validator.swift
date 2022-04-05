//
//  Validator.swift
//  datingApp
//
//  Created by Thien Vu on 05/04/2022.
//

import Foundation

public func validPassword(_ password: String) -> Bool {
    let validKey = "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}"
    
    let validPass = NSPredicate(format: "SELF MATCHES %@", validKey)
    return validPass.evaluate(with: password)
}
