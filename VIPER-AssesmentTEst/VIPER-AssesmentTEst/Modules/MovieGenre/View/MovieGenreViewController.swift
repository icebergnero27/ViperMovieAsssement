//
//  MovieGenreViewController.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import UIKit

class MovieGenreViewController: UIViewController {

    var movieGenrePresenter: ViewToPresenterMovieGenreProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var data: Array<MovieGenreEntity> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movie Genre"
        
        infoLabel.isHidden = true
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        movieGenrePresenter?.startFetchingMovieGenre()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MovieGenreViewController: PresenterToViewMovieGenreProtocol{
    func onMovieGenreResponseSuccess(movieModelArrayList: Array<MovieGenreEntity>) {
        self.data = movieModelArrayList
        self.tableView.reloadData()
        activityIndicatorView.isHidden = true
        infoLabel.isHidden = true
    }
    
    func onMovieGenreResponseFailed(error: String) {
        activityIndicatorView.isHidden = true
        infoLabel.isHidden = false
        infoLabel.text = error
    }
}

extension MovieGenreViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        let viewModel = data[indexPath.row]
        cell.textLabel?.text = viewModel.name
        return cell
    }
}

