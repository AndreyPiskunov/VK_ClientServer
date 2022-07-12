//
//  AllFriendsController.swift
//  VK
//
//  Created by User on 06.06.2022.
//

import UIKit

class MyFriendsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let fromFriendListToPhotoAlbumSeque = "fromFriendListToPhotoAlbum"
    
    let customTableViewCellIdentifire = "customTableViewCellIdentifire"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myFriends = fillData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellIdentifire)
    }
    
    func fillData() -> [Friend] {
        let myPhoto1 = MyPhoto(url: "moto1")
        let myPhoto2 = MyPhoto(url: "moto2")
        let myPhoto3 = MyPhoto(url: "moto3")
        
        let myPhoto4 = MyPhoto(url: "car1")
        let myPhoto5 = MyPhoto(url: "car2")
        let myPhoto6 = MyPhoto(url: "car3")
        
        let myPhoto7 = MyPhoto(url: "picture1")
        let myPhoto8 = MyPhoto(url: "picture2")
        let myPhoto9 = MyPhoto(url: "picture3")
        


        let friend1 = Friend(name: "Andrey",
                             surname: "Ivanov",
                             age: "30",
                             avatar: "image096-74",
                             photoAlbum: [myPhoto1,myPhoto2,myPhoto3])
        
        let friend2 = Friend(name: "Boris",
                             surname: "Petrov",
                             age: "25",
                             avatar: "unnamed-2",
                             photoAlbum: [myPhoto4,myPhoto5,myPhoto6])
        
        let friend3 = Friend(name: "Sergey",
                             surname: "Ovchinnikov",
                             age: "29",
                             avatar: "unnamed-3",
                             photoAlbum: [myPhoto7,myPhoto8,myPhoto9])
        
        var friendsArray = [Friend]()
        
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        
        return friendsArray
}
    var myFriends = [Friend]()
}

   
    
    
