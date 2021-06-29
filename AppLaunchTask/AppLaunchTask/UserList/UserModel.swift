//
//  UserModel.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import Foundation

class User
{
    var id: Int = 0
    var email: String = ""
    var firstName: String = ""
    var lastName : String = ""
    
    
    init(id:Int, email:String, firstName:String,lastName:String)
    {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
    }
    
}
