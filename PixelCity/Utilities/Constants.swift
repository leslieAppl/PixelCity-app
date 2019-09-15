//
//  Constants.swift
//  PixelCity
//
//  Created by leslie on 9/15/19.
//  Copyright © 2019 leslie. All rights reserved.
//

import Foundation

let API_KEY = "b3330b029755e0903e9af7fd36fead09"

func flickrUrl(forApiKey key: String, withAnnotation annotation: DroppablePin, andNumberOfPhotos number: Int) -> String {
    let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_KEY)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=1&radius_units=km&per_page=\(number)&format=json&nojsoncallback=1"
    print(url)
    return url
}

