//
//  HotelHomePageProtocol.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import Foundation
protocol HotelHomePageProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getHotelsSuccess()
    func showError(error: String)
}
