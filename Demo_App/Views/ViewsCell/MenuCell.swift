//
//  MenuCell.swift
//  Demo_App
//
//  Created by Apple on 11/20/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MenuCell: BaseCell {
    
    let itemLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            itemLabel.textColor = isHighlighted ? UIColor.white : UIColor.rpb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            itemLabel.textColor = isSelected ? UIColor.white : UIColor.rpb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(itemLabel)
        addContrainsWithFormat("H:[v0]", view: itemLabel)
        addContrainsWithFormat("V:[v0]", view: itemLabel)
        addConstraint(NSLayoutConstraint(item: itemLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: itemLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
}
