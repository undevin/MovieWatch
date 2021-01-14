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
    var releaseYear: Int?
    var genre: String?
    var watchDate: Date?
    
    init(title: String, director: String?, releaseYear: Int?, genre: String?, watchDate: Date?) {
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
        self.genre = genre
        self.watchDate = watchDate
    }
    
}//End of Class

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
    }
}

