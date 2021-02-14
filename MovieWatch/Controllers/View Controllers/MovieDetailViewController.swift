//
//  MovieDetailViewController.swift
//  MovieWatch
//
//  Created by Devin Flora on 1/14/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var movieTitleTextField: UITextField!
    @IBOutlet weak var directorTextField: UITextField!
    @IBOutlet weak var releaseYearTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var watchedDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Properties
    var movie: Movie?
    var date: Date?
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = movieTitleTextField.text, !title.isEmpty else { return }
        if let movie = movie {
            MovieController.shared.updateMovie(movie: movie, title: title, director: directorTextField.text ?? "", releaseYear: releaseYearTextField.text ?? "", genre: genreTextField.text ?? "", watchDate: watchedDatePicker.date, isWatched: false)
        } else {
            MovieController.shared.createMovieWith(title: title, director: directorTextField.text ?? "", releaseYear: releaseYearTextField.text ?? "", genre: genreTextField.text ?? "", watchDate: watchedDatePicker.date, isWatched: false)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func watchDatePicker(_ sender: Any) {
        self.date = watchedDatePicker.date
    }
    
    // MARK: - Methods
    func updateViews() {
        guard let movie = movie else { return }
        movieTitleTextField.text = movie.title
        directorTextField.text = movie.director
        releaseYearTextField.text = movie.releaseYear
        genreTextField.text = movie.genre
        watchedDatePicker.date = movie.watchDate ?? Date()
    }
}//End of Class
