//
//  ViewController.swift
//  Demo_App
//
//  Created by Apple on 11/16/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MovieDelegate {

    var movieArray: Array<Movie> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton()
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor(red: 38/255, green: 50/255, blue: 56/255, alpha: 1)
        collectionView?.register(MovieCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
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
        return self.movieArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MovieCell
        cell.backgroundColor = UIColor(red: 38/255, green: 50/255, blue: 56/255, alpha: 1)
        let movieData = self.movieArray[indexPath.row]
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
        label.backgroundColor = .green
        label.text = "DEADPOOL"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = "2016"
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.text = "Action, Funny, somethings ....."
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.text = "Action, Funny, somethings .....Action, Funny, somethings .....Action, Funny, somethings ....."
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

extension UIView {
    
    func addContrainsWithFormat(_ format: String, view views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}

