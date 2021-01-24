//
//  HotelHomePagePresenter.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
class HotelHomePagePresenter {
    private let hotelHomePageInteractor:HotelHomePageInteractor
    private var hotelsList: [Hotel]
    private weak var hotelHomePageProtocol: HotelHomePageProtocol?
    
    init(hotelHomePageProtocol: HotelHomePageProtocol) {
        self.hotelHomePageProtocol = hotelHomePageProtocol
        self.hotelHomePageInteractor = HotelHomePageInteractor()
        self.hotelsList = [Hotel]()
    }
    
    func getHotels() {
        
        hotelHomePageProtocol?.showIndicator()
        hotelHomePageInteractor.getHotels(){ (result,error)  in
            if let error = error {
                print("errrror  \(error)")
                self.hotelHomePageProtocol?.showError(error: error.localizedDescription)
            }
            else {
                if result != nil{
                    self.hotelsList = result!
                    print("get my bookings result \(result)")
                    self.hotelHomePageProtocol?.getHotelsSuccess()
                    
                }
                
            }
            
        }
    }
 
    func hotelsCount() -> Int {
        return hotelsList.count
    }
    
    
    func configure(cell: HotelHomePageTableViewCellConfigureProtocol, for index: Int) {
        let hotel = hotelsList[index]
        guard let hotelName = hotel.summary?.hotelName, let hotelImage = hotel.hotelImageList[0]?.url else{
            return
        }
        cell.configure(hotelImage: hotelImage, hotelName: hotelName)
        
        
    }

}
