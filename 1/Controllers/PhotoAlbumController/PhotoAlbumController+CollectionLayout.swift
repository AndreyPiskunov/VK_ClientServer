//
//  PhotoAlbumController+Layout.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

extension PhotoAlbumViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let whiteSpaces: CGFloat = 10
        let cellWidth = width / 2 - whiteSpaces
        
        return CGSize(width: cellWidth , height: cellWidth)
    }

}
