//
//  PhotoAlbumViewController+DataSource.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

extension PhotoAlbumViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return self.photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifire, for: indexPath) as! PhotoCollectionViewCell
        
        let image = UIImage(named: photoAlbum[indexPath.item].url)
        
        allImage.append(UIImage(named: photoAlbum[indexPath.item].url)!)
        
        cell.configure(image: image)
        
        return cell
    }
}
