//
//  MovieGenreInteractor.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

public enum MovieError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}

public class MovieGenreInteractor : PresenterToInteractorMovieGenreProtocol {
    
    public static let shared = MovieGenreInteractor()
    private init() {}
    private let apiKey = "a74a3f6cf1a31d97c2bf1598718e1875"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    var presenter: InteractorToPresenterMovieGenreProtocol?

    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()

    func fetchMovieGenre() {
        
        guard var urlComponents = URLComponents(string: "\(baseAPIURL)/genre/movie/list") else {
            self.presenter?.movieGenreFetchFailed(error: "Invalid Endpoint")
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            self.presenter?.movieGenreFetchFailed(error: "Invalid Endpoint")
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.presenter?.movieGenreFetchFailed(error: "API Error")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.presenter?.movieGenreFetchFailed(error: "Invalid Response")
                return
            }
            
            guard let data = data else {
                self.presenter?.movieGenreFetchFailed(error: "No Data")
                return
            }
            
            do {
                let genresResponse = try self.jsonDecoder.decode(GenresResponse.self, from: data)
                DispatchQueue.main.async {
                    self.presenter?.movieGenreFetchSuccess(movieList: genresResponse.genres)
                }
            } catch {
                self.presenter?.movieGenreFetchFailed(error: "Wrong Entity")
            }
        }.resume()
        
    }
    
}
