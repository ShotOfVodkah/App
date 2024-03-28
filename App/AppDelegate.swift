//
//  AppDelegate.swift
//  App
//
//  Created by Stepan Polyakov on 25.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        window.rootViewController = ControllerAgreement()
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

