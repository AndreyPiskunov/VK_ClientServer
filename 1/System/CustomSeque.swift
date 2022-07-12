//
//  CustomSeque.swift
//  VK
//
//  Created by User on 27.06.2022.
//

import UIKit

class CustomSeque: UIStoryboardSegue {

    override func perform() {
        guard let sourceController = self.source as? PhotoAlbumViewController,
                let destinationController = self.destination as? GalleryViewController,
                let sourceControllerSuperView = sourceController.view.superview,
                let sourceView = sourceController.view,
                let destinationView = destinationController.view
    else {
        super.perform()
        return
    }

        sourceControllerSuperView.addSubview(destinationView)
        
        let sourceViewFrame = sourceView.frame
        let centerZeroPoint = CGRect(x: sourceViewFrame.width / 2, y: sourceViewFrame.height / 2, width: 0, height: 0)
        
        destinationView.frame = centerZeroPoint
        
        UIView.animate(withDuration: 3) {
            sourceView.frame = centerZeroPoint
        } completion: { _ in
            UIView.animate(withDuration: 3) {
                destinationView.frame = sourceViewFrame
            } completion: { _ in
                sourceController.present(destinationController, animated: false)
            }

        }
}
}
