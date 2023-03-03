//
//  ContactViewModel.swift
//  contact_fetch
//
//  Created by Yuvrajsinh on 11/11/22.
//

import Foundation
//MARK: Contact model for save data in databse
struct ContectModel {
    let name,number: String
    let userImage: Data
    init(name: String, number: String, userImage: Data) {
        self.name = name
        self.number = number
        self.userImage = userImage
    }
}
