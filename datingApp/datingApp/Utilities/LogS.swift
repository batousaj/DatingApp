//
//  LogS.swift
//  datingApp
//
//  Created by Thien Vu on 15/01/2022.
//

import Foundation
import OSLog
//import struct Logging.Logger

extension OSLog {
  private static var subsystem = Bundle.main.bundleIdentifier!
  
  static let ui = OSLog(subsystem: subsystem, category: "UI")
  static let network = OSLog(subsystem: subsystem, category: "Network")
  static let client = OSLog(subsystem: subsystem, category: "Client")
}

class LogS {
    
    var label:String!
    var oslogger:OSLog!
    
    public init(label: String) {
        self.label = label
        self.oslogger = OSLog(subsystem: label, category: "")
    }
    
    static func LogServer(_ log: String) {
        os_log( "[%@]:%@ %@", log: .network, type: .info, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
    
    static func LogClient(_ log: String) {
        os_log( "[%@]:%@ %@", log: .client, type: .info, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
    
    static func LogUI(_ log: String) {
        os_log( "[%@]:%@ %@", log: .ui, type: .info, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
    
    static func LogErrorServer(_ log: String) {
        os_log( "[%@]:%@ %@", log: .network, type: .error, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
    
    static func LogErrorClient(_ log: String) {
        os_log( "[%@]:%@ %@", log: .client, type: .error, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
    
    static func LogWarningClient(_ log: String) {
        os_log( "[%@]:%@ %@", log: .client, type: .fault, UtilitiesDate.getCurrentDateTimeToString(), ModelConstData.NK_LOG, log )
    }
}
