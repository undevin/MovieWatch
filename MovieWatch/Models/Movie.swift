//
//  Movie.swift
//  MovieWatch
//
//  Created by Devin Flora on 1/14/21.
//

import Foundation

class Movie: Codable {
    
    var title: String
    var director: String?
    var releaseYear: String?
    var genre: String?
    var watchDate: Date?
    var isWatched: Bool
    
    init(title: String, director: String?, releaseYear: String?, genre: String?, watchDate: Date?, isWatched: Bool = false) {
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
        self.genre = genre
        self.watchDate = watchDate
        self.isWatched = isWatched
    }
    
}//End of Class

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
    }
}

