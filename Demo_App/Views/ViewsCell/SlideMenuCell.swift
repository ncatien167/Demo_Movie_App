//
//  SlideMenuCell.swift
//  Demo_App
//
//  Created by Apple on 11/20/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SlideMenuCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Tien Dep Trai"
        label.textColor = UIColor.rpb(red: 226, green: 228, blue: 229)
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logout-icon")
        return image
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(titleLabel)
        addSubview(imageView)
        
        addContrainsWithFormat("H:|-20-[v0(30)]-10-[v1]|", view: imageView, titleLabel)
        addContrainsWithFormat("V:|[v0]|", view: titleLabel)
        addContrainsWithFormat("V:[v0(35)]", view: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
