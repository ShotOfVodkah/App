//
//  Scene+CoreDataProperties.swift
//  App
//
//  Created by Stepan Polyakov on 27.03.2024.
//
//

import Foundation
import CoreData

@objc(Scene)
public class Scene: NSManagedObject {

}

extension Scene {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scene> {
        return NSFetchRequest<Scene>(entityName: "Scene")
    }
    
    @NSManaged public var id: Int16
    @NSManaged public var sentence: String?
    @NSManaged public var character: String?
    @NSManaged public var emotion: String?
    @NSManaged public var background: String?
    @NSManaged public var next: Int16
    
}

extension Scene : Identifiable {

}
