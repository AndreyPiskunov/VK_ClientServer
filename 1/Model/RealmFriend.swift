//
//  Friend.swift
//  VK
//
//  Created by User on 05.06.2022.
//

import Foundation
import RealmSwift

class Friend: Object {
    
    @objc dynamic var userName: String = ""
    @objc dynamic var userAvatar: String = ""
    
    init(userName:String, userAvatar:String){
        self.userName = userName
        self.userAvatar = userAvatar
    }
}
