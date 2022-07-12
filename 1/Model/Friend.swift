//
//  Friend.swift
//  VK
//
//  Created by User on 05.06.2022.
//

import Foundation

struct Friend {
    var name: String
    var surname: String?
    var age: String?
    var avatar: String?
    var photoAlbum: [MyPhoto]
}
struct MyPhoto {
    var url: String
}
