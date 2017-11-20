//
//  SlideMenu.swift
//  Demo_App
//
//  Created by Apple on 11/20/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SettingSlideMenu: NSObject {
    
    let title: String
    let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}

class SlideMenu: NSObject {
    
    let menuView = UIView()
    
    let contentView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        return cv
    }()
    
    let cellId = "cellId"
    
    func showSlideMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            
            menuView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(menuView)
            window.addSubview(contentView)

            contentView.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
            
            let width = (300/375) * window.frame.size.width
            let x = window.frame.size.width - width
            contentView.frame = CGRect(x: window.frame.width, y: 0, width: width, height: window.frame.size.height)
            
            menuView.frame = window.frame
            menuView.alpha = 0
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.menuView.alpha = 1
                self.contentView.frame = CGRect(x: x, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
                
            }, completion: nil)
            
            showCollectionView()
        }
    }
    
    @objc func handleDismiss() {
        
        UIView.animate(withDuration: 0.5) {
            self.menuView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.contentView.frame = CGRect(x: window.frame.width, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
            }
        }
    }
    
    func showCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        
        contentView.addContrainsWithFormat("H:|[v0]|", view: collectionView)
        contentView.addContrainsWithFormat("V:|-64-[v0]|", view: collectionView)
    }
    
    
    
    override init() {
        super.init()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SlideMenuCell.self, forCellWithReuseIdentifier: cellId)
    }
}

extension SlideMenu: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlideMenuCell
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 50)
    }
}
