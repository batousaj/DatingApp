//
//  Constanst.swift
//  datingApp
//
//  Created by Thien Vu on 03/04/2022.
//

import Foundation
import UIKit

enum ConnectionState {
    case kConnectionUnavailable
    case kConnectionCellular
    case kConnectionWifi
    case kNone
}
typealias NetworkState = ConnectionState

class ModelConstData {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let NK_LOG = "[NK_LOG]"
    
}

