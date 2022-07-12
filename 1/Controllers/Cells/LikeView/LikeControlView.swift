//
//  LikeControlView.swift
//  VK
//
//  Created by User on 12.06.2022.
//

import UIKit

class LikeControlView: UIView {

    
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    
    
    var countLike = 0
    var isPressed = false
    
    override init (frame: CGRect) {
        super.init (frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
     super .init(coder: coder)
        setup()
    }
    
    private func loadFromXIB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeControlView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup() {
        let xibView = loadFromXIB()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(xibView)
        countLabel.text = String(countLike)
    }
    
    @IBAction func pressLikeButton(_ sender: UIButton) {
        isPressed = !isPressed
            if isPressed {
                countLike += 1
                heartImageView.image = UIImage(systemName: "heart.fill")
            } else {
                countLike -= 1
                heartImageView.image = UIImage(systemName: "heart")

            }
            countLabel.text = String(countLike)
        }
    }
