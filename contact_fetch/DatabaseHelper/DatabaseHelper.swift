//
//  DatabaseHelper.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 11/11/22.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    static var sharedInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    // Data save in database
    func save(data: ContectModel ){
        let contect = NSEntityDescription.insertNewObject(forEntityName: Constants.CD_ENTITY_NAME, into: context!) as! Contacts
        
        contect.number = data.number
        contect.name = data.name
        contect.image = data.userImage
        do {
            try context?.save()
        } catch  {
            print("data not saved")
        }
    }
    // Get Contect Data from Database
    func getContact () -> [Contacts]{
        var contacts = [Contacts]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:
                                                            Constants.CD_ENTITY_NAME)
        do {
            contacts = try context?.fetch(fetchRequest) as! [Contacts]
        }catch{
            print ("can not get data" )
        }
        for contact in contacts {
            print(contact.name)
            print(contact.number)
        }
        return contacts
    }
    // Delete all Data from entity
    func delete() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.CD_ENTITY_NAME)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context?.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
}
