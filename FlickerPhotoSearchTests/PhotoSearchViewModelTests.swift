//
//  PhotoSearchViewModelTests.swift
//  PhotoSearchGallaryTests
//
//  Created by MAC on 28/02/22.
//

import XCTest
import Combine
@testable import FlickerPhotoSearch

class PhotoSearchViewModelTests: XCTestCase {

    var viewModel:PhotoSearchViewModel!
    var respository:SearchRepository!
    var networkManager:MockNetworkManager!
    
    override func setUpWithError() throws {
        
        networkManager = MockNetworkManager()
        
        respository = SearchRepository(networkManager: networkManager)
        viewModel = PhotoSearchViewModel(searchRepository: respository)
    }


    override func tearDownWithError() throws {
        viewModel = nil
    
    }

    func testSearchPhotos_success() {
        
        let request = ApiRequest(baseUrl: EndPoint.baseUrl, path:"Search_Success_Responce", params:["method":"flickr.photos.search", "text":"dog", "api_key": "060c8bb57f264d10dc6463cce0a8f230", "format" : "json", "nojsoncallback" : "1"])

       
        viewModel.searchPhotos(apiRequest: request)
    
        
            XCTAssertEqual(self.viewModel.photos.count, 0)

    }
    
    func testSearchPhotos_failure() {

        let request = ApiRequest(baseUrl: EndPoint.baseUrl, path:"failure", params:["method":"flickr.photos.search", "text":"dog", "api_key": "060c8bb57f264d10dc6463cce0a8f230", "format" : "json", "nojsoncallback" : "1"])

        viewModel.searchPhotos(apiRequest: request)

        XCTAssertEqual(viewModel.photos.count, 0)

    }
    
   

}
