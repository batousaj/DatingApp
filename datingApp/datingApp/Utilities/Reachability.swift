//
//  Reachability.swift
//  datingApp
//
//  Created by Thien Vu on 01/04/2022.
//

import Foundation
import Reachability


enum NetworkState {
    case kUnavailable
    case kWifi
    case kCellular
}

class ReachableManagement {
    
    var reachability: Reachability?
    
    deinit {
        stopNotifier()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onReachabilityChanged(_:)),
                                               name: .reachabilityChanged,
                                               object: nil)
    }
    
    func startHost(hostname:String) {
        self.stopNotifier()
        setupReachability(hostname: hostname)
        self.startNotifier()
        weak var reachable = self
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            reachable?.startHost(hostname: hostname)
        }
    }
    
    func setupReachability(hostname:String) {
        LogS.LogClient("--- set up with host name: \(hostname)")
        do {
            if hostname != "" {
                reachability = try Reachability()
            } else {
                reachability = try Reachability(hostname: hostname)
            }
        } catch {
            LogS.LogErrorClient("TV_CHECK_LOG: Start Reachable failed")
        }
        self.registerNotification()
    }
    
    func startNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            LogS.LogErrorClient("TV_CHECK_LOG: Start startNotifier failed")
        }
        
    }
    
    func stopNotifier() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
        reachability = nil
    }
    
// Observer function in NotificationCenter
    @objc func onReachabilityChanged(_ notification:Notification) {
        let reachable = notification.object as! Reachability
        var networkState:NetworkState!
        switch reachable.connection {
            case Reachability.Connection.unavailable:
                networkState = NetworkState.kUnavailable
                break
            case Reachability.Connection.cellular:
                networkState = NetworkState.kCellular
                break
            case Reachability.Connection.wifi:
                networkState = NetworkState.kWifi
                break
            default:
                break
        }
        NotificationCenter.default.post(name: .networkReachabilityChanged, object: networkState)
    }
}

public extension Notification.Name {

    static let networkReachabilityChanged = Notification.Name("networkReachabilityChanged")
}
