//
//  PhotoSearchViewModel.swift
//  FlickerPhotoSearch
//
//  Created by Geetha on 27/02/22.
//

import Foundation
import Combine

class PhotoSearchViewModel: ObservableObject {
    
    let searchRepository:SearchRepositoryType
    private var cancellables:Set<AnyCancellable> = Set()

    @Published var photos:[PhotoDetail] = []
    @Published var searchText: String = ""
    
    init(searchRepository:SearchRepositoryType) {
        self.searchRepository = searchRepository
        searchTextListner()
    }
    
    func searchPhotos(apiRequest: ApiRequestType) {
        let publisher =   self.searchRepository.searchPhotos(apiRequest: apiRequest)
        
        let cancalable = publisher            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(_):
                print("Failed")
            }
        } receiveValue: { [weak self ] photosDetail in
             self?.photos = photosDetail
        }
        self.cancellables.insert(cancalable)
    }
    
    private func searchTextListner() {
        $searchText.debounce(for: 2, scheduler: RunLoop.main).sink {
            
            let request = ApiRequest(baseUrl: EndPoint.baseUrl, path:Path.search, params:["method":Constants.method, "text":$0, "api_key": Constants.apiKey, "format" : Constants.format, "nojsoncallback" : Constants.nojsoncallback])
            
            self.searchPhotos(apiRequest: request)
            
        }.store(in: &cancellables)
    }
    
    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}
