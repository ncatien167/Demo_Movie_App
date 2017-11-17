//
//  MenuBar.swift
//  Demo_App
//
//  Created by Apple on 11/17/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class  MenuBar: UIView /*, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout*/ {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //cv.dataSource = self
        //cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        //collectionView.dataSource = self
        //collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.addContrainsWithFormat("H:|[v0]|", view: collectionView)
        collectionView.addContrainsWithFormat("V:|[v0(20)]", view: collectionView)
        collectionView.backgroundColor = .blue
        //backgroundColor = .red
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
//        cell.backgroundColor = UIColor.rpb(red: 200, green: 50, blue: 56)
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
