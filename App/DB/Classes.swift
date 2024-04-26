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
    @NSManaged public var on_screen: String?
    @NSManaged public var character: String?
    @NSManaged public var emotion: String?
    @NSManaged public var background: String?
    @NSManaged public var next: Int16
    
}

extension Scene : Identifiable {
}


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


class Person {
    var name: String
    var emotion: String
    
    init(n: String, s: String) {
        self.name = n
        self.emotion = s
    }
}

struct Deque<T> {
    private var array = [T]()

    mutating func append(_ element: T) {
        array.append(element)
        if array.count > 5 {
            array.removeFirst()
        }
    }

    func peek(at index: Int) -> T? {
        guard index >= 0 && index < array.count else {
            return nil
        }
        return array[index]
    }

    var count: Int {
        return array.count
    }
}

class Save {
    var numChapter: Int16
    var numScene: Int16
    var finished: Bool
    
    init(numChapter: Int16, numScene: Int16, finished: Bool) {
        self.numChapter = numChapter
        self.numScene = numScene
        self.finished = finished
    }
}

var saveData = Save(numChapter: 1, numScene: 0, finished: false)
var fight: Bool = true
var not_peace: Bool = false
var director: Bool = false
