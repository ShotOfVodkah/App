//
//  Choice+CoreDataProperties.swift
//  App
//
//  Created by Stepan Polyakov on 29.03.2024.
//
//

import Foundation
import CoreData


@objc(Choice)
public class Choice: NSManagedObject {

}

extension Choice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Choice> {
        return NSFetchRequest<Choice>(entityName: "Choice")
    }

    @NSManaged public var id: Int16
    @NSManaged public var n1: Int16
    @NSManaged public var n2: Int16
    @NSManaged public var n3: Int16
    @NSManaged public var c1: String?
    @NSManaged public var c2: String?
    @NSManaged public var c3: String?
    @NSManaged public var c4: String?
    @NSManaged public var n4: Int16

}

extension Choice : Identifiable {

}
