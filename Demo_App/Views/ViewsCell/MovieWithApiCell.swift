//
//  MovieWithApiCell.swift
//  Demo_App
//
//  Created by Apple on 11/21/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class MovieWithApiCell: BaseCell {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let cellId = "cellId"
    
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
    
    override func setupViews() {
        super.setupViews()

        backgroundColor = .brown
        
        addSubview(collectionView)
        
        addContrainsWithFormat("H:|[v0]|", view: collectionView)
        addContrainsWithFormat("V:|[v0]|", view: collectionView)
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}

extension MovieWithApiCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MovieCell
        cell.backgroundColor = UIColor.rpb(red: 38, green: 50, blue: 56)
        let movieData = movies[indexPath.item]
        cell.moviesSetting = movieData
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let addMovieVc = storyboard.instantiateViewController(withIdentifier: "AddMovieViewController") as! AddMovieViewController
        //        addMovieVc.movie = movieArray[indexPath.row]
        //        let nav = UINavigationController.init(rootViewController: addMovieVc)
        //        self.present(nav, animated: true, completion: nil)
    }
    
}
