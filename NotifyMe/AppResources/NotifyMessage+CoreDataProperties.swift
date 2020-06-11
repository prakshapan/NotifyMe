//
//  NotifyMessage+CoreDataProperties.swift
//  NotifyMe
//
//  Created by Praks on 6/10/20.
//  Copyright © 2020 Praks. All rights reserved.
//
//

import Foundation
import CoreData


extension NotifyMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NotifyMessage> {
        return NSFetchRequest<NotifyMessage>(entityName: "NotifyMessage")
    }

    @NSManaged public var date: Date?
    @NSManaged public var detail: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    
    var wrappedDate: Date {
        date ?? Date()
    }
    
    var wrappedTitle: String {
        title ?? ""
    }
    
    var wrappedDetail: String {
        detail ?? ""
    }
}
