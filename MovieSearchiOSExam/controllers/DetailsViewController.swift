//
//  DetailsViewController.swift
//  MovieSearchiOSExam
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imdbID: String?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let imdbID = imdbID {
            Task {
                let results = try? await DataProvider.findMoviesByImbdID(imdbID)
                movie = results ?? nil
                
                if let movie = movie {
                    titleLabel.text = movie.Title
                    dateLabel.text = movie.Year
                    imageView.loadFrom(url: movie.Poster)
                    plotLabel.text = movie.Plot
                    lenghtLabel.text = movie.Runtime
                    directorLabel.text = movie.Director
                    genreLabel.text = movie.Genre
                    countryLabel.text = movie.Country

                }
            }
        }
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
