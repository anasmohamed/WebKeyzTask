//
//  Hotel.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import SwiftyJSON
struct CachableHotels: Cachable, Codable {
    let hotels: [Hotel]

    var fileName: String {
        return "hotels"
    }

    init(hotels: [Hotel]) {
        self.hotels = hotels
    }
}
class Hotel : Codable{
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
    enum CodingKeys : String, CodingKey {
        case hotelId = "hotelId"
        
    }
}

class HotelImages:Codable {
    var url : String?
    init(withJson data:JSON) {
        self.url = data["url"].stringValue
    }
    enum CodingKeys : String, CodingKey {
        case url = "url"
    }
}
class HotelSummary :Codable{
    var highRate : String?
    var hotelName : String?
    var lowRate : String?
    init(withJson data :JSON) {
        self.highRate = data["highRate"].stringValue
        self.hotelName = data["hotelName"].stringValue
        self.lowRate = data["lowRate"].stringValue
    }
    enum CodingKeys : String, CodingKey {
        
        case highRate = "highRate"
        case hotelName = "hotelName"
        case lowRate = "lowRate"
        
    }
}
class HotelLocation:Codable {
    var address : String?
    var latitude : String?
    var longitude : String?
    init(withJson data:JSON) {
        self.address = data["address"].stringValue
        self.latitude = data["latitude"].stringValue
        self.longitude = data["longitude"].stringValue
        
    }
    enum CodingKeys : String, CodingKey {
        
        case address = "address"
        case latitude = "latitude"
        case longitude = "longitude"
        
    }
}
