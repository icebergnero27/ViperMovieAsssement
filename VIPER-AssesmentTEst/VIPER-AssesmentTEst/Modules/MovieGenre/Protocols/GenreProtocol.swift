//
//  GenreProtocol.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

protocol ViewToPresenterMovieGenreProtocol: class{
    
    var view: PresenterToViewMovieGenreProtocol? {get set}
    var interactor: PresenterToInteractorMovieGenreProtocol? {get set}
    var router: PresenterToRouterMovieGenreProtocol? {get set}
    func startFetchingMovieGenre()

}

protocol PresenterToViewMovieGenreProtocol: class {
    
    func onMovieGenreResponseSuccess(movieModelArrayList: Array<MovieGenreEntity>)
    func onMovieGenreResponseFailed(error: String)
    
}

protocol PresenterToRouterMovieGenreProtocol:class {
    
    static func createMovieGenreModule()-> MovieGenreViewController

}

protocol PresenterToInteractorMovieGenreProtocol: class {
    
    var presenter:InteractorToPresenterMovieGenreProtocol? {get set}
    func fetchMovieGenre()
    
}

protocol InteractorToPresenterMovieGenreProtocol: class {
    
    func movieGenreFetchSuccess(movieList:Array<MovieGenreEntity>)
    func movieGenreFetchFailed(error: String)
    
}
