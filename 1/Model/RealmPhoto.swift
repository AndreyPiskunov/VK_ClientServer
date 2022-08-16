//
//  Photo.swift
//  VK
//
//  Created by Andrey Piskunov on 07.08.2022.
//

import Foundation
import RealmSwift

class Photo: Object {
    
    @Persisted var photo: String = ""
    
    init(photo: String){
        self.photo = photo
        
    }
}

