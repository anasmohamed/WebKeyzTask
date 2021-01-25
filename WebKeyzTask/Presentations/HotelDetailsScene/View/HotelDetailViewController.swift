//
//  HotelDetailViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Kingfisher
class HotelDetailViewController: UIViewController {
    
    @IBOutlet weak var highRatePriceLbl: UILabel!
    @IBOutlet weak var lowRatePriceLbl: UILabel!
    @IBOutlet weak var hotelLocationLbl: UILabel!
    @IBOutlet weak var hotelNameLbl: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    var hotel : Hotel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        hotelImageView.kf.setImage(with: URL(string: (hotel?.hotelImageList[0]?.url)!))
        lowRatePriceLbl.text = hotel?.summary?.lowRate
        highRatePriceLbl.text = hotel?.summary?.highRate
        highRatePriceLbl.strikeThroughText()
        hotelNameLbl.text = hotel?.summary?.hotelName
        hotelLocationLbl.text = hotel?.location?.address
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension UILabel {
  func strikeThroughText() {
    let attributeString =  NSMutableAttributedString(string: self.text ?? "")
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
    self.attributedText = attributeString
  }
}
