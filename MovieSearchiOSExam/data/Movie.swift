//
//  Movie.swift
//  MovieSearchiOSExam
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

struct Movies: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let `Type`: String
    let Poster: String
    let Plot: String?
    let Runtime: String?
    let Director: String?
    let Genre: String?
    let Country: String?
}
