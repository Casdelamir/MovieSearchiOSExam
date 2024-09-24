//
//  TableViewCell.swift
//  MovieSearchiOSExam
//
//  Created by Mañanas on 24/9/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    func render(movie: Movie) {
        posterView.loadFrom(url: movie.Poster)
        titleLabel.text = movie.Title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
