//
//  FavoritesStore.swift
//  iCatchUp
//
//  Created by Operador on 11/5/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FavoritesStore {
    let entityName = "Favorite"
    func context() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.container.viewContext
    }
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func save() {
        appDelegate.saveContext()
    }
    
    // Add new Favorita mark
    func add(from source: Source) {
        if find(for: source) != nil {
            return
        }
        if let entity = NSEntityDescription.entity(
            forEntityName: entityName, in: context()) {
            let newFavorite = NSManagedObject(entity: entity, insertInto: context())
            newFavorite.setValue(source.id, forKey:"sourceId")
            newFavorite.setValue(source.name, forKey: "sourceName")
            save()
        }
    }
    
    // Retrieves all stored favorite marks
    func all() -> [NSManagedObject] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let result = try context().fetch(request)
            return result as! [NSManagedObject]
        } catch {
            print("Error while fectching: \(error.localizedDescription)")
        }
        return []
    }
    
    // Find Favorite mark for source
    func find(for source: Source) -> NSManagedObject? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.predicate = NSPredicate(format: "sourceId = %@", source.id)
        do {
            let result = try context().fetch(request) as! [NSManagedObject]
            return result.count == 0 ? nil : result.first
            
        } catch {
            print("Error while finding: \(error.localizedDescription)")
        }
        return nil
    }
    
    // Deletes Favorite mark for source
    func delete(for source: Source) {
        if let favorite = find(for: source) {
            do {
                try favorite.validateForDelete()
                context().delete(favorite)
                save()
            } catch {
                print("Error while deleting: \(error.localizedDescription)")
            }
        }
    }
    
    // This method returns true if source is marked as favorite
    func isFavorite(source: Source) -> Bool {
        return find(for: source) != nil
    }
    
    // Returns comma separated String with favorited source Ids
    func sourceIdsAsString() -> String {
        return all().map{$0.value(forKey: "sourceId") as! String}.joined()
    }
    // Singleton
    static var shared = FavoritesStore()
    
    private init() {
        
    }
    
}
