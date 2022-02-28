//
//  ServiceError.swift
//  Movies
//
//  Created by Geetha on 25/02/22.
//

import Foundation

enum ServiceError: Error {
    case failedToCreateRequest
    case dataNotFound
    case parsingError
    case networkNotAvailable

}
