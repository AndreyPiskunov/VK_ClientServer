//
//  CustomTableViewCell.swift
//  tableView
//
//  Created by User on 05.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fotoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var fotoCornerImage: DropShadowView!
    
    let cornerRadius : CGFloat = 15.0
    
    override func awakeFromNib() {
        let cornerRadius : CGFloat = 15.0
        
        fotoImageView.layer.cornerRadius = cornerRadius
        fotoImageView.layer.shadowColor = UIColor.systemGray.cgColor
        fotoImageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        fotoImageView.layer.shadowRadius = 15.0
        fotoImageView.layer.shadowOpacity = 0.9

        fotoImageView.layer.cornerRadius = cornerRadius
        fotoImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        surnameLabel.text = nil
        fotoImageView.image = nil
        descriptionLabel.text = nil
    }
    
    func configure(image: UIImage?, name: String?, surname: String?, description: String?){
        fotoImageView.image = image
        nameLabel.text = name
        descriptionLabel.text = description
        surnameLabel.text = surname
       }

    func configure(_ group: Group) {
        fotoImageView.image = UIImage(named: group.groupAvatar)
        nameLabel.text = group.groupName
        descriptionLabel.text = group.description
        }
}
