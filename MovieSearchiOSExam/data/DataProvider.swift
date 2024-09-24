//
//  DataProvider.swift
//  MovieSearchiOSExam
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class DataProvider {

    static func findMoviesByTitle(_ title: String) async throws -> [Movie] {
        guard let url = URL(string: "\(Constants.BASE_URL)&s=\(title)") else {
            print("URL not valid")
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        let result = try JSONDecoder().decode(Movies.self, from: data)
        return result.Search
    }
    
    static func findMoviesByImbdID(_ imdbID: String) async throws -> Movie? {
        guard let url = URL(string: "\(Constants.BASE_URL)&i=\(imdbID)") else {
            print("URL not valid")
            return nil
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        
        let result = try JSONDecoder().decode(Movie.self, from: data)
        return result
    }
    
   /* static func findMoviesByTitle(_ title: String, withResult: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)&s=\(title)") else {
            print("URL not valid")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                // Process the data
                let result = try! JSONDecoder().decode(Movies.self, from: data)
                withResult(result.movies)
            }
        }
        task.resume()
    }*/
    
}
