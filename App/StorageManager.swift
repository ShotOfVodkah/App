//
//  StorageManager.swift
//  App
//
//  Created by Stepan Polyakov on 28.03.2024.
//

import Foundation
import UIKit
import CoreData

public final class SceneManager: NSObject {
    public static let shared = SceneManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    public func createScene(_ id: Int16, background: String, character: String, emotion: String, next: Int16, sentence: String) {
        guard let Sceneentitydescription = NSEntityDescription.entity(forEntityName: "Scene", in: context) else {
            return
        }
        let scene = Scene(entity: Sceneentitydescription, insertInto: context)
        scene.id = id
        scene.background = background
        scene.character = character
        scene.emotion = emotion
        scene.next = next
        scene.sentence = sentence
        
        appDelegate.saveContext()
    }
    
    public func fetchScene(_ id: Int16) -> Scene? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scene")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            guard let scenes = try? context.fetch(fetchRequest) as? [Scene] else { return nil }
            return scenes.first
        }
    }
    
    public func deleteAll() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scene")
        do {
            let scenes = try? context.fetch(fetchRequest) as? [Scene]
            scenes?.forEach{context.delete($0)}
        }
        appDelegate.saveContext()
    }
}
