//
//  MovieCell.swift
//  Demo_App
//
//  Created by Apple on 11/17/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var movieSetting: Movie? {
        didSet {
            posterImageView.image = movieSetting?.poster
            titleLabel.text = movieSetting?.title
            yearLabel.text = movieSetting?.year
            typeLabel.text = movieSetting?.type
            infoLabel.text = movieSetting?.info
        }
    }
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let separatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = .white
        return separator
    }()
    
    func setupViews() {
        addSubview(posterImageView)
        addSubview(titleLabel)
        addSubview(yearLabel)
        addSubview(typeLabel)
        addSubview(infoLabel)
        addSubview(separatorView)
        
        addContrainsWithFormat("H:|-20-[v0(100)]-10-[v1]-10-|", view: posterImageView, titleLabel)
        addContrainsWithFormat("V:|-35-[v0(30)]-15-[v1(30)]-3-[v2(20)]-10-[v3]-19.5-[v4(0.5)]|", view: titleLabel, yearLabel, typeLabel, infoLabel,separatorView)
        addContrainsWithFormat("H:|-20-[v0]-10-[v1]-10-|", view: posterImageView, yearLabel)
        addContrainsWithFormat("H:|-20-[v0]-10-[v1]-10-|", view: posterImageView, typeLabel)
        addContrainsWithFormat("H:|-20-[v0]-10-[v1]-10-|", view: posterImageView, infoLabel)
        addContrainsWithFormat("V:|-35-[v0]-19.5-|", view: posterImageView)
        addContrainsWithFormat("H:|-10-[v0]|", view: separatorView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
