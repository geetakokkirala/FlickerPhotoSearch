//
//  FlickerPhotoSearchApp.swift
//  FlickerPhotoSearch
//
//  Created by MAC on 28/02/22.
//

import SwiftUI

@main
struct FlickerPhotoSearchApp: App {
    var body: some Scene {
        WindowGroup {
            PhotoSearchView(searchViewModel:PhotoSearchViewModel(searchRepository: SearchRepository()))
                .padding()        }
    }
}
