//
//  MovieListTableViewController.swift
//  MovieWatch
//
//  Created by Devin Flora on 1/14/21.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.shared.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MovieController.shared.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let movieToDelete = MovieController.shared.movies[indexPath.row]
            MovieController.shared.deleteMovie(movie: movieToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? MovieDetailViewController else { return }
            let movieToSend = MovieController.shared.movies[indexPath.row]
            destination.movie = movieToSend
        }
    }
}//End of Class

// MARK: - Extension
extension MovieListTableViewController: MovieWatchedDelegate {
    func movieWatchedButtonTapped(cell: MovieTableViewCell) {
        
    }
}
