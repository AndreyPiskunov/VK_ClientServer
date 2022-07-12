//
//  PhotoCollectionViewCell.swift
//  VK
//
//  Created by User on 07.06.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    
    func configure(image: UIImage?) {
        photoImageView.image = image
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
