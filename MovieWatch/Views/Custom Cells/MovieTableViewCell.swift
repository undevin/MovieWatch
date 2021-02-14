//
//  MovieTableViewCell.swift
//  MovieWatch
//
//  Created by Devin Flora on 1/14/21.
//

import UIKit

protocol MovieWatchedDelegate: AnyObject {
    func movieWatchedButtonTapped(cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var movieWatchedLabel: UIButton!
    
    weak var delegate: MovieWatchedDelegate?
    var movie: Movie? {
        didSet {
            guard let movie = movie else { return }
            updateViews(movie: movie)
        }
    }
    
    // MARK: - Actions
    @IBAction func movieWatchedButtonTapped(_ sender: Any) {
        delegate?.movieWatchedButtonTapped(cell: self)
    }
    
    // MARK: - Helper Functions
    func updateViews(movie: Movie) {
        movieTitleLabel.text = movie.title
        genreLabel.text = movie.genre
        if movie.isWatched {
            movieWatchedLabel.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            movieWatchedLabel.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}//End of Class
