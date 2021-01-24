//
//  Hotel.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON

class Hotel{
    var hotelId : String?
    var hotelImageList = [HotelImages?]()
    var location : HotelLocation?
    var summary : HotelSummary?
    init?(withJson data: JSON) {
        self.hotelId = data["hotelId"].stringValue
        self.location = HotelLocation(withJson: data["location"])
        self.summary = HotelSummary(withJson: data["summary"])
        let hotelImages = data["image"].arrayValue
        
        for image in hotelImages
        {
            let imageData = HotelImages(withJson: image)
            self.hotelImageList.append(imageData)
        }
    }
}
class HotelImages {
    var url : String?
    init(withJson data:JSON) {
        self.url = data["url"].stringValue
    }
}
class HotelSummary {
    var highRate : String?
    var hotelName : String?
    var lowRate : String?
    init(withJson data :JSON) {
        self.highRate = data["highRate"].stringValue
        self.hotelName = data["hotelName"].stringValue
        self.lowRate = data["lowRate"].stringValue
    }
}
class HotelLocation {
    var address : String?
    var latitude : String?
    var longitude : String?
    init(withJson data:JSON) {
        self.address = data["address"].stringValue
        self.latitude = data["latitude"].stringValue
        self.longitude = data["longitude"].stringValue
        
    }
}
