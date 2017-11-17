//
//  AddMovieViewController.swift
//  Demo_App
//
//  Created by Apple on 11/17/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

protocol MovieDelegate {
    func sendMovie(movieData: Movie!)
}

class AddMovieViewController: BaseViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var actorsTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var delegate: MovieDelegate?
    weak var movie: Movie!
    let base = BaseViewController()
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton()
        self.picker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTextFieldWithMovie()
    }
    
    func setupTextFieldWithMovie() {
        if movie != nil {
            self.posterImageView.image = movie.poster
            self.titleTextField.text = movie.title
            self.yearTextField.text = movie.year
            self.actorsTextView.text = movie.type
            self.descriptionTextView.text = movie.info
        }
    }
    
    func backButton() {
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func validateTextField(poster: UIImage!, title: String!, year: String!, actors: String!, description: String!, completion: (Bool, String) -> ()) {
        if poster == nil {
            completion(false, "Poster is empty.")
            return
        }
        
        if title.isEmpty {
            completion(false, "Title is empty.")
            return
        }
        
        if year.isEmpty {
            completion(false, "Year is empty.")
            return
        }
        
        if actors.isEmpty {
            completion(false, "Actors is empty.")
            return
        }
        
        if description.isEmpty {
            completion(false, "Description is empty.")
            return
        }
        
        completion(true, "")
    }
    
    func addMovie() {
        let posterImageView = self.posterImageView.image
        let titleTextField = self.titleTextField.text
        let yearTextField = self.yearTextField.text
        let actorsTextView = self.actorsTextView.text
        let descriptionTextView = self.descriptionTextView.text
        
        validateTextField(poster: posterImageView, title: titleTextField,
                          year: yearTextField, actors: actorsTextView,
                          description: descriptionTextView) { (isValidate, message) in
            
            if isValidate == false {
                base.showAlertWith(title: "Error", message: message, viewController: self)
            } else {
                if movie == nil {
                    let movies = Movie(poster: posterImageView!, title: titleTextField!, year: yearTextField!, type: actorsTextView!, info: descriptionTextView!)
                    movie = movies
                    print(movie.title)
                    if let movieData = delegate {
                        movieData.sendMovie(movieData: movie)
                    }
                } else {
                    movie.poster = posterImageView
                    movie.title = titleTextField
                    movie.year = yearTextField
                    movie.type = actorsTextView
                    movie.info = descriptionTextView
                }
            }
        }
    }
    
    @IBAction func addNewButtonPressed(_ sender: Any) {
        addMovie()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension AddMovieViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func choosePickerButtonPressed(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
    }
    
}
