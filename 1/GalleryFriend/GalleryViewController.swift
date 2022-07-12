//
//  GalleryViewController.swift
//  VK
//
//  Created by User on 25.06.2022.
//

import UIKit

class GalleryViewController: UIViewController {
    
    var imageGallerySelectedIndexPath = 0
    var imageGalleryFoto = [UIImage]()
    
    
    @IBOutlet weak var galleryView: HorisontView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryView.setImages (images: imageGalleryFoto, imageGallerySelectedIndexPath: imageGallerySelectedIndexPath)
    }
}











    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
