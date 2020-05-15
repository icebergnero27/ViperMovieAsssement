//
//  MovieGenrePresenter.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

class MovieGenrePresenter:ViewToPresenterMovieGenreProtocol{
    
    var view: PresenterToViewMovieGenreProtocol?
    
    var interactor: PresenterToInteractorMovieGenreProtocol?
    
    var router: PresenterToRouterMovieGenreProtocol?
    
    func startFetchingMovieGenre() {
        
        interactor?.fetchMovieGenre()
    }
    
}

extension MovieGenrePresenter: InteractorToPresenterMovieGenreProtocol{
    func movieGenreFetchSuccess(movieList: Array<MovieGenreEntity>) {
        view?.onMovieGenreResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieGenreFetchFailed(error: String) {
        view?.onMovieGenreResponseFailed(error: error)
    }
    
}
