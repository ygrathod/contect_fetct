//
//  ViewModel.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 11/11/22.
//

import Foundation
import Contacts
import CoreData
import UIKit
//MARK: Contact view model For Contact view Controller
class ContactViewModel {
    var contectList = [Contacts]()
    
    // fetch Contact from Contact book
    func fetchContact(){
        DatabaseHelper.sharedInstance.delete()
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to request access:", err)
                return
            }
            if granted {

                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey,CNContactImageDataAvailableKey, CNContactThumbnailImageDataKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointerIfYouWantToStopEnumerating) in
                        DatabaseHelper.sharedInstance.save(data: ContectModel(name: contact.givenName, number: contact.phoneNumbers.first?.value.stringValue ?? "", userImage: contact.thumbnailImageData ?? Data()))
                    })
                } catch let err {
                    print("Failed to enumerate contacts:", err)
                }
                
            } else {
                print("Access denied..")
            }
        }
    }
    
    // get contact from database
    func getContract() {
        contectList = DatabaseHelper.sharedInstance.getContact()
    }
    
}


