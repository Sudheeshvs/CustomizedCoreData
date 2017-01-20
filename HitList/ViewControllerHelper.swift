//
//  ViewControllerHelper.swift
//  HitList
//
//  Created by Sudheesh on 1/20/17.
//  Copyright © 2017 DevelopScripts. All rights reserved.
//

import UIKit
import CoreData

extension ViewController{
    
    func saveName(name: String){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        if let entity = NSEntityDescription.entityForName("Person",inManagedObjectContext:managedContext){
            let person = NSManagedObject(entity: entity, insertIntoManagedObjectContext: managedContext)
            person.setValue(name, forKey: "name")
            do{
                try managedContext.save()
                people.append(person)
            }
            catch let error as NSError{
                print("Error : \(error.localizedFailureReason)")
            }
        }
    }
    
    func fetchDataFromEntity() -> [NSManagedObject]{
        var people = [NSManagedObject]()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        do{
            people = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
        }
        catch let error as NSError{
            print("Error Fetch : \(error.localizedFailureReason)")
        }
        return people
    }
}
