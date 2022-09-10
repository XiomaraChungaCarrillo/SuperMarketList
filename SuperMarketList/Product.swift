//
//  Product.swift
//  SuperMarketList
//
//  Created by Xio iOS on 9/09/22.
//

import CoreData

@objc(Product)
class Product: NSManagedObject{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
    
    
}
