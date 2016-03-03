//
//  Sound+CoreDataProperties.swift
//  Soundboard
//
//  Created by Jianfeng Yang on 3/3/16.
//  Copyright © 2016 Jianfeng Yang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Sound {

    @NSManaged var name: String?
    @NSManaged var url: String?

}
