//
//  PhotoAlbumViewController.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

class PhotoAlbumViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let collectionViewCellReuseIdentifire = "collectionViewCellReuseIdentifire"
    let fromCollectionFriendToGallery = "fromCollectionFriendToGallery"
    
    var photoAlbum = [MyPhoto] ()
    var allImage = [UIImage] ()
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: collectionViewCellReuseIdentifire)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    
  
    override func viewWillAppear(_ animated: Bool){
        
        super.viewWillAppear(animated)
        collectionView.reloadData()
        }
        
}





