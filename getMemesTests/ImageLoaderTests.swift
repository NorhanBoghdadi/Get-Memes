//
//  ImageLoaderTests.swift
//  getMemesTests
//
//  Created by Norhan Boghdadi on 3/12/22.
//

import XCTest
@testable import getMemes

class ImageLoaderTests: XCTestCase {
    
    func testImageLoader() {
        let sut = ImageLoader.shared
        let imageUrl = "https://i.imgflip.com/3lmzyx.jpg"
        let img = UIImage(named: "meme-test")
        let imgData = img?.pngData()
        sut.loadImageData(url: URL(string: imageUrl)!) { results in
            switch results {
            case .failure(let error):
                XCTAssertThrowsError(error)
            case .success(let data):
                XCTAssertEqual(data, imgData)
            }
                
        }
    }

}
