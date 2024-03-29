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
    
    public func createChoice(id: Int16, c1: String, c2: String, c3: String, c4: String, n1: Int16, n2: Int16, n3: Int16, n4: Int16) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Choice", in: context) else {
            return
        }
        let newEntity = Choice(entity: entityDescription, insertInto: context)
        newEntity.id = id
        newEntity.c1 = c1
        newEntity.c2 = c2
        newEntity.c3 = c3
        newEntity.c4 = c4
        newEntity.n1 = n1
        newEntity.n2 = n2
        newEntity.n3 = n3
        newEntity.n4 = n4
        
        appDelegate.saveContext()
    }

    public func fetchChoice(byID id: Int16) -> Choice? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Choice")
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        do {
            guard let entities = try? context.fetch(fetchRequest) as? [Choice] else { return nil }
            return entities.first
        }
    }

    public func deleteAllScenes() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scene")
        do {
            let scenes = try? context.fetch(fetchRequest) as? [Scene]
            scenes?.forEach{context.delete($0)}
        }
        appDelegate.saveContext()
    }
    
    public func deleteAllChoices() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Choice")
        do {
            let scenes = try? context.fetch(fetchRequest) as? [Scene]
            scenes?.forEach{context.delete($0)}
        }
        appDelegate.saveContext()
    }
}
