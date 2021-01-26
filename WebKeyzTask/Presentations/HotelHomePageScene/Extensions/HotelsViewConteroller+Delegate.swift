//
//  HotelsViewConteroller+Delegate.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
import UIKit
extension HotelHomePageViewController : HotelHomePageProtocol{
    func showIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideIndicator() {
        activityIndicator.stopAnimating()

    }
    
    func getHotelsSuccess() {
        activityIndicator.stopAnimating()
      
        hotelsCollectionView.reloadData()
    }
    
    func showError(error: String) {
        activityIndicator.stopAnimating()

    }
    
  
    
}
