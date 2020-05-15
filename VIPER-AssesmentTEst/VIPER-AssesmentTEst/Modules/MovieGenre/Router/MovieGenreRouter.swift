//
//  MovieGenreRouter.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import UIKit

class MovieGenreRouter: PresenterToRouterMovieGenreProtocol{
    
    static func createMovieGenreModule() -> MovieGenreViewController {
        
        let view = MovieGenreRouter.mainStoryboard.instantiateViewController(withIdentifier: "movieGenreViewController") as! MovieGenreViewController
        
        let presenter: ViewToPresenterMovieGenreProtocol & InteractorToPresenterMovieGenreProtocol = MovieGenrePresenter()
        let interactor: PresenterToInteractorMovieGenreProtocol = MovieGenreInteractor.shared
        let router: PresenterToRouterMovieGenreProtocol = MovieGenreRouter()
        
        view.movieGenrePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainStoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }
    
}
