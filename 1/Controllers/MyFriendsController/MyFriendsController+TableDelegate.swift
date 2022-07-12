//
//  MyFriendsController+TableDelegate.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

extension MyFriendsController: UITableViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == fromFriendListToPhotoAlbumSeque,
            let destinationController = segue.destination as? PhotoAlbumViewController,
            let photos = sender as? [MyPhoto] {
            
            destinationController.photoAlbum = photos
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let photos = myFriends[indexPath.row].photoAlbum
        
        performSegue(withIdentifier: fromFriendListToPhotoAlbumSeque, sender: photos )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    return 100
    }

}

