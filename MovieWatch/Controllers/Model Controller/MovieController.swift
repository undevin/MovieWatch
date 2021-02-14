//
//  MovieController.swift
//  MovieWatch
//
//  Created by Devin Flora on 1/14/21.
//

import Foundation

class MovieController {
    
    static let shared = MovieController()
    
    var movies: [Movie] = []
    
    // MARK: - CRUD Methods
    func createMovieWith(title: String, director: String, releaseYear: String, genre: String, watchDate: Date?, isWatched: Bool) {
        let movie = Movie(title: title, director: director, releaseYear: releaseYear, genre: genre, watchDate: watchDate, isWatched: isWatched)
        movies.append(movie)
        saveToPersistenceStore()
    }
    
    func updateMovie(movie: Movie, title: String, director: String, releaseYear: String, genre: String, watchDate: Date?, isWatched: Bool) {
        movie.title = title
        movie.director = director
        movie.releaseYear = releaseYear
        movie.genre = genre
        movie.watchDate = watchDate
        movie.isWatched = isWatched
        saveToPersistenceStore()
    }
    
    func toggleMovieIsWatched(movie: Movie) {
        movie.isWatched.toggle()
        saveToPersistenceStore()
    }
    
    func deleteMovie(movie: Movie) {
        guard let index = movies.firstIndex(of: movie) else { return }
        movies.remove(at: index)
        saveToPersistenceStore()
    }
    
    
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Movies.json")
        return fileURL
    }
    
    //save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(movies)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    //load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            movies = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}//End of Class
