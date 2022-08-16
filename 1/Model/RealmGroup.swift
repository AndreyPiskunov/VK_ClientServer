//
//  Group.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import Foundation
import RealmSwift

class Group: Object {
    @Persisted var groupName: String = ""
    @Persisted var groupAvatar: String = ""
    
    init(groupName: String, groupAvatar: String){
        self.groupName = groupName
        self.groupAvatar = groupAvatar
    }
}
