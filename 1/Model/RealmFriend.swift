//
//  Friend.swift
//  VK
//
//  Created by User on 05.06.2022.
//

import Foundation
import RealmSwift

//struct Friend {
//    var name: String
////    var surname: String?
////    var age: String?
//    var avatar: String?
////    var photoAlbum: [MyPhoto]
//}


class Friend: Object {
    
    @objc dynamic var userName: String = ""
    @objc dynamic var userAvatar: String = ""
    
    init(userName:String, userAvatar:String){
        self.userName = userName
        self.userAvatar = userAvatar
    }
}
