//
//  Group.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import Foundation
import RealmSwift

//struct Group {
//    var name: String
//    var description: String?
//    var avatar: String
//}

class Group: Object {
    @objc dynamic var groupName: String = ""
    @objc dynamic var groupAvatar: String = ""
    
    init(groupName: String, groupAvatar: String){
        self.groupName = groupName
        self.groupAvatar = groupAvatar
    }
}
