//
//  MovieGenreEntity.swift
//  VIPER-AssesmentTEst
//
//  Created by Innovez One on 15/05/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation

public struct GenresResponse: Codable {
    public let genres: [MovieGenreEntity]
}

public struct MovieGenreEntity: Codable {
    let id: Int
    let name: String
}
