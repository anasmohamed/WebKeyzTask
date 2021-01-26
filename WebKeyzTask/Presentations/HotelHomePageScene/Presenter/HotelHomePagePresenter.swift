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
    let hotelListCache = NSCache<NSString,Hotel>()
    let cacher: Cacher = Cacher(destination: .temporary)
    
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
                        self.cacheHotels()
                        print("get my bookings result \(result)")
                        self.hotelHomePageProtocol?.getHotelsSuccess()
                        
                    }
                    
                }
                
            }
       
        
        
        
        
    }
    func cacheHotels()  {
        let cachableHotels = CachableHotels(hotels: hotelsList)
        cacher.persist(item: cachableHotels){url, error in
            if let error = error {
                print("Text failed to persist: \(error)")
            } else {
                print("Text persisted in \(String(describing: url))")
            }
        }
    }
    func getCachedHotels(){
        if let cachedHotels: CachableHotels = cacher.load(fileName: "hotels") {
            // Replace the current text with the cached one
            hotelsList = cachedHotels.hotels
         
            self.hotelHomePageProtocol?.getHotelsSuccess()

        }
    }
    
    func hotelsCount() -> Int {
        return hotelsList.count
    }
    func hotel(index: Int) -> Hotel {
        return hotelsList[index]
    }
    
    func configure(cell: HotelHomePageCollectionViewCellConfigureProtocol, for index: Int) {
        let hotel = hotelsList[index]
        guard let hotelName = hotel.summary?.hotelName, let hotelImage = hotel.hotelImageList[0]?.url else{
            return
        }
        cell.configure(hotelImage: hotelImage, hotelName: hotelName)
        
        
    }
    
}
