//
//  ViewController.swift
//  MovieSearchiOSExam
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        searchMoviesByTitle("bat")
        
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        
        let movie = movieList[indexPath.row]
        
        cell.render(movie: movie)
        
        return cell
    }
    
    func searchMoviesByTitle(_ query: String) {
        Task {
            let results = try? await DataProvider.findMoviesByTitle(query)
            
            self.movieList = results ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as! DetailsViewController

            let indexPath = tableView.indexPathForSelectedRow!
            print(movieList[indexPath.row].imdbID)
 
            viewController.imdbID = movieList[indexPath.row].imdbID

           tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    // MARK: SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMoviesByTitle(searchBar.text!)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMoviesByTitle("bat")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText.isEmpty) {
            searchMoviesByTitle("bat")
        }
    }
}

