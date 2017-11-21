//
//  ViewController.swift
//  Demo_App
//
//  Created by Apple on 11/16/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let slideMenu = SlideMenu()
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    let cellId = "cellId"
    let apiCellId = "apiCellId"
    let titles = ["Home", "Collection View"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        showMenuButton()
        addButton()
        setupMenuBar()
        setupCollectionView()
    }
    
    func showMenuButton() {
        let image = UIImage(named: "nav-menu")
        let menuButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(menuButtonPressed(_:)))
        navigationItem.leftBarButtonItem = menuButton
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        slideMenu.showSlideMenu()
    }

    func addButton() {
        let addButon = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = addButon
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addMovieVc = storyboard.instantiateViewController(withIdentifier: "AddMovieViewController") as! AddMovieViewController
        let nav = UINavigationController.init(rootViewController: addMovieVc)
        self.present(nav, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.isPagingEnabled = true
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(MovieWithApiCell.self, forCellWithReuseIdentifier: apiCellId)
        
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: .init(rawValue: 0), animated: true)
        
        setupTitleNavigation(with: menuIndex)
    }
    
    private func setupTitleNavigation(with menuIndex: Int) {
        let title = titles[menuIndex]
        navigationItem.title = title
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addContrainsWithFormat("H:|[v0]|", view: menuBar)
        view.addContrainsWithFormat("V:[v0(50)]", view: menuBar)

        //menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension HomeViewController {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print(targetContentOffset.pointee.x / view.frame.width)
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .init(rawValue: 0))
        
        setupTitleNavigation(with: Int(index))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if indexPath.item == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: apiCellId, for: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
