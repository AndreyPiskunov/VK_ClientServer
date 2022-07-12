//
//  PhotoAlbumController+CollectionDelegate.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

extension PhotoAlbumViewController: UICollectionViewDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.destination is GalleryViewController,
           let destination = segue.destination as? GalleryViewController,
           let imageGallerySelectedIndexPath = sender as? Int

          {
            destination.imageGallerySelectedIndexPath = imageGallerySelectedIndexPath
            destination.imageGalleryFoto = allImage
            allImage = []
        }
    }
    
    @objc func onTap(_ recognizer:UITapGestureRecognizer){
        guard let targetView = recognizer.view else {return}
        targetView.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        let imageGallerySelectedIndexPath = indexPath.item
        
        performSegue(withIdentifier: "fromAlbumToGallery", sender: imageGallerySelectedIndexPath )
    }
}
