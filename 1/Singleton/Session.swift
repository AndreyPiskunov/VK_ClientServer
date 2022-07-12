//
//  Session.swift
//  VK
//
//  Created by Andrey Piskunov on 12.07.2022.
//

import Foundation

class Session {
    private init() {}
    
    static let shared = Session()

    var token:String = "Andrey Piskunov"
    var userId:Int = 22
}
