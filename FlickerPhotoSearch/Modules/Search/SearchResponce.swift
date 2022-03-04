//
//  SearchResponce.swift
//  FlickerPhotoSearch
//
//  Created by  Geetha on 27/02/22.
//

import Foundation

// MARK: - FlickerSearchResonce
struct SearchResponce: Codable {
    let photos: Photos
}

// MARK: - Photos
struct Photos: Codable {
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, secret, server: String
    let title: String
}
