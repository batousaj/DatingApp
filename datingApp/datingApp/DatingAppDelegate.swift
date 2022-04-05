//
//  AppDelegate.swift
//  datingApp
//
//  Created by Vu Thien on 15/11/2021.
//

import UIKit
import Firebase

@main
class DatingAppDelegate: UIResponder, UIApplicationDelegate {
    
    //ViewController in bottom Toolbar
    var matchView = MatchViewController()
    

// MARK: - Setup Application.
    
    func registerDelegate() {
        
    }

// MARK: - Application lifecycle.
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Firebase Configured
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

