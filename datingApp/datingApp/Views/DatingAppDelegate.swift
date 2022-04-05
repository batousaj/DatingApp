//
//  AppDelegate.swift
//  datingApp
//
//  Created by Vu Thien on 15/11/2021.
//

import UIKit
import Firebase
import Reachability

@main
class DatingAppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    
    //constant in view
    let hostname = "www.apple.com"
    
    //subview in main window
    var navigatorView:UINavigationController!
    var networkStatusNotifyView = UIView()
    var networkStatusNotifyText:UILabel!
    
    //ViewController in bottom Toolbar
    var tabBarView:UITabBarController!
    var matchView:MatchViewController!
    var chatView:ChatViewController!
    var advView:AdvertiseViewController!
    var buddyView:BuddyListViewController!
    
    //network management
    var reachableMange = ReachableManagement()
    
    var window: UIWindow?
    
// MARK: - Setup Application.
    
    func registerDelegate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onChangNetwork(_:)),
                                               name: .networkReachabilityChanged,
                                               object: nil)
    }
    
    func createTabBar() {
        //match view
        self.matchView = MatchViewController()
        let matchViewNavi = UINavigationController(rootViewController: self.matchView)
        matchViewNavi.setupNavigatorView()
        matchView.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icon-logo.jpg"), tag: 1)
        
        //chat view
        self.chatView = ChatViewController()
        let chatViewNavi = UINavigationController(rootViewController: self.chatView)
        chatViewNavi.setupNavigatorView()
        chatView.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icon-chat.jpg"), tag: 2)
        
        //adv view
        self.advView = AdvertiseViewController()
        let advViewNavi = UINavigationController(rootViewController: self.advView)
        advViewNavi.setupNavigatorView()
        chatView.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icone-superlike.jpg"), tag: 3)
        
        //buddy view
        self.buddyView = BuddyListViewController()
        let buddyViewNavi = UINavigationController(rootViewController: self.buddyView)
        buddyViewNavi.setupNavigatorView()
        buddyView.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icone-superlike.jpg"), tag: 4)
        
        self.tabBarView.viewControllers = [matchViewNavi,chatViewNavi,advViewNavi,buddyViewNavi]
        
    }
    
    func setupSubView() {
        self.tabBarView = UITabBarController()
        self.navigatorView = UINavigationController(rootViewController: self.tabBarView)
        self.navigatorView.setupNavigatorView()
        self.window?.rootViewController = self.navigatorView
        self.window?.makeKeyAndVisible()
    }
    
    func startApplication() {
        self.createTabBar()
        self.setupSubView()
        self.setupNetworkNotifyView()
    }

// MARK: - Application lifecycle.
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.registerDelegate()
        startApplication()
        reachableMange.startHost(hostname: self.hostname)
        //Firebase Configured
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


// MARK: - Check Network Status
    func setupNetworkNotifyView() {
        self.networkStatusNotifyView.translatesAutoresizingMaskIntoConstraints = false
        self.networkStatusNotifyText = UILabel()
        self.networkStatusNotifyText.frame.size = self.networkStatusNotifyView.frame.size
        
        self.networkStatusNotifyView.addSubview(self.networkStatusNotifyText)
    }
    
    func showNetworkStatus(_ state: NetworkState) {
        switch state {
            case NetworkState.kConnectionUnavailable:
                self.showTextNetworkUnavailable()
                self.unhideNetworkStatus()
                break
            case NetworkState.kConnectionCellular:
                self.showTextConnecting()
                self.unhideNetworkStatus()
                self.perform(#selector(unhideNetworkStatus), with: nil, afterDelay: 1)
                break
            case NetworkState.kConnectionWifi:
                self.showTextConnecting()
                self.unhideNetworkStatus()
                self.perform(#selector(unhideNetworkStatus), with: nil, afterDelay: 1)
                break
            default :
                break
        }
    }
    
    func showTextNetworkUnavailable() {
        self.networkStatusNotifyText.text = NSLocalizedString("id_metwork_unavailable", comment: "")
        self.networkStatusNotifyText.backgroundColor = .systemRed
    }

    func showTextConnecting() {
        self.networkStatusNotifyText.text = NSLocalizedString("id_connecting", comment: "")
        self.networkStatusNotifyText.backgroundColor = .systemGreen
    }
    
    @objc func hideNetworkStatus() {
        self.networkStatusNotifyView.isHidden = true
    }
    
    @objc func unhideNetworkStatus() {
        self.networkStatusNotifyView.isHidden = false
    }
    
}

// MARK: - extension DatingAppDelegate

extension DatingAppDelegate {
    
    @objc func onChangNetwork(_ notification : Notification) {
        let state = notification.object as! NetworkState
        self.showNetworkStatus(state)
    }
}
