//
//  AppDelegate.swift
//  FirebaseTest
//
//  Created by Valya on 15.10.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userDefaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let window = UIWindow()
        
       
        let isLogin = userDefaults.object(forKey: "isLogin") as? Bool ?? false
        if isLogin {
            window.rootViewController = MainViewController()
            window.makeKeyAndVisible()
            self.window = window
        } else {
            window.rootViewController = ViewController()
            window.makeKeyAndVisible()
            self.window = window
        }
        
        return true
    }
}

