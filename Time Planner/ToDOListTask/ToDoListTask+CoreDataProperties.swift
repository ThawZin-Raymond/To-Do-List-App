//
//  ToDoListTask+CoreDataProperties.swift
//  Time Planner
//
//  Created by Thaw Zin on 19/5/21.
//
//

import Foundation
import CoreData


extension ToDoListTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListTask> {
        return NSFetchRequest<ToDoListTask>(entityName: "ToDoListTask")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListTask : Identifiable {

}
