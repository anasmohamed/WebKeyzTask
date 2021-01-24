//
//  HotelHomePageInteractor.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class HotelHomePageInteractor {
    func getHotels(
        completionHandler: @escaping ([Hotel]?, Error?) -> Void) {
        AF.request(WebKeyzTask.getHotels).validate().responseJSON{
            (response) in
            let result = response.result
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            if let request = response.request {
                print("Request Request: \(request)")
                print("Request Description: \(request.description)")
                print("Request Debug Description: \(request.debugDescription)")
                
                print("Response Request HTTP method: \(request.httpMethod!)")
                //                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            switch result {
            case .success :
                let json = JSON(response.value)
                print(json)
                var hotelsList = [Hotel]()
                let hotels = json["hotel"].arrayValue
                
                
                for hotel in hotels
                {
                    let data = Hotel(withJson: hotel)
                    
                    hotelsList.append(data!)
                    
                }
                completionHandler(hotelsList, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
        
    }
}
