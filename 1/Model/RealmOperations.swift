//
//  RealmOperations.swift
//  VK
//
//  Created by Andrey Piskunov on 15.08.2022.
//

import Foundation

import RealmSwift

class RealmOperations {
    
    func saveFriendToRealm(_ friendList: [Friend]){
        
        do {
            let realm = try Realm()  //получаем
            realm.beginWrite()     //изменяем
            realm.add(friendList)    //кладем
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }

    func saveGroupToRealm(_ groupList: [Group]){
        do {
            let realm = try Realm()  //получаем
            realm.beginWrite()     //изменяем
            realm.add(groupList)    //кладем
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
