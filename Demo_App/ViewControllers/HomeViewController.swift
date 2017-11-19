//
//  ViewController.swift
//  Demo_App
//
//  Created by Apple on 11/16/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MovieDelegate {
    
    var movies: [Movies] = {
       var addMovie = Movies()
        addMovie.title = "DeadPool"
        addMovie.poster = UIImage(named: "deadpool_movie")
        addMovie.year = "2016"
        addMovie.type = "Actor, Funny"
        addMovie.info = "So Funny"
        return [addMovie]
    }()
    var movieArray: Array<Movie> = []
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        collectionView?.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addContrainsWithFormat("H:|[v0]|", view: menuBar)
        view.addContrainsWithFormat("V:[v0(50)]", view: menuBar)
    }
    
    func sendMovie(movieData: Movie!) {
        movieArray.append(movieData)
    }
    
    func addButton() {
        let addButon = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = addButon
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addMovieVc = storyboard.instantiateViewController(withIdentifier: "AddMovieViewController") as! AddMovieViewController
        addMovieVc.delegate = self
        let nav = UINavigationController.init(rootViewController: addMovieVc)
        self.present(nav, animated: true, completion: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count//self.movieArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MovieCell
        cell.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        let movieData = movies[indexPath.row]
        cell.movieSetting = movieData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addMovieVc = storyboard.instantiateViewController(withIdentifier: "AddMovieViewController") as! AddMovieViewController
        addMovieVc.movie = movieArray[indexPath.row]
        let nav = UINavigationController.init(rootViewController: addMovieVc)
        self.present(nav, animated: true, completion: nil)
    }
    
}
