//
//  Friend.swift
//  VK
//
//  Created by User on 05.06.2022.
//

import Foundation
import RealmSwift

class Friend: Object {
    
    @Persisted var userName: String = ""
    @Persisted var userAvatar: String = ""
    
    init(userName:String, userAvatar:String){
        self.userName = userName
        self.userAvatar = userAvatar
    }
}
