//
//  HotelHomePageTableViewCell.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Kingfisher
class HotelHomePageCollectionViewCell: UICollectionViewCell,HotelHomePageCollectionViewCellConfigureProtocol{
  
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var containerView: DropShadowView!
    @IBOutlet weak var hotelNameLbl: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    let cornerRadius : CGFloat = 5.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        containerView.layer.shadowRadius = 3.0
        containerView.layer.shadowOpacity = 0.6
        
        mainView.layer.cornerRadius = cornerRadius
        mainView.clipsToBounds = true
    }
    
   
    func configure(hotelImage: String, hotelName: String) {
        hotelNameLbl.text = hotelName
        hotelImageView.kf.setImage(with: URL(string: hotelImage))
    }
 
      
}
