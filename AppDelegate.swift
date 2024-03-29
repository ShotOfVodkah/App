//
//  AppDelegate.swift
//  App
//
//  Created by Stepan Polyakov on 25.03.2024.
//

import UIKit
import CoreData

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
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Scenes")
        container.loadPersistentStores{ description, error in
            if let error {
                print(error.localizedDescription)
            } else {
                print("DB url", description.url?.absoluteString)
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}


    

