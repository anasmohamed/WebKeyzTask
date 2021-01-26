//
//  HotelDetailViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Kingfisher
class HotelDetailsViewController: UIViewController {
    
    @IBOutlet weak var showLocationOnMapBtn: UIButton!
    @IBOutlet weak var highRatePriceLbl: UILabel!
    @IBOutlet weak var lowRatePriceLbl: UILabel!
    @IBOutlet weak var hotelLocationLbl: UILabel!
    @IBOutlet weak var hotelNameLbl: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    var hotel : Hotel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLocationOnMapBtn.layer.cornerRadius = 10
        showLocationOnMapBtn.layer.borderColor = UIColor.init(red: 0/255, green: 125/255, blue: 255/255, alpha: 1).cgColor
        showLocationOnMapBtn.layer.borderWidth = 1
        let hotelImageViewTap = UITapGestureRecognizer(target: self, action: #selector(handleHotelImageTapped(tapGestureRecognizer:)))
        hotelImageView.addGestureRecognizer(hotelImageViewTap)
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        hotelImageView.kf.setImage(with: URL(string: (hotel?.hotelImageList[0]?.url)!))
        lowRatePriceLbl.text = (hotel?.summary?.lowRate)! + "$"
        highRatePriceLbl.text = (hotel?.summary?.highRate)! + "$"
        highRatePriceLbl.strikeThroughText()
        hotelNameLbl.text = hotel?.summary?.hotelName
        hotelLocationLbl.text = hotel?.location?.address
        
    }
    
    @IBAction func showLocationOnMapBtnDidTapped(_ sender: Any) {
        
        let hotelLocationMapViewController = storyboard?.instantiateViewController(withIdentifier: "HotelLocationMapViewController") as! HotelLocationMapViewController
        hotelLocationMapViewController.hotelName = hotel?.summary?.hotelName
        hotelLocationMapViewController.hotelLatitude = hotel?.location?.latitude
        hotelLocationMapViewController.hotelLongitude = hotel?.location?.longitude
        self.navigationController!.pushViewController(hotelLocationMapViewController, animated: true)
    }
    
    @objc func handleHotelImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let hotelPopupImageViewController = storyboard?.instantiateViewController(withIdentifier: "HotelPopupImageViewController") as! HotelPopupImageViewController
      //  hotelPopupImageViewController.hotelImage = hotel?.hotelImageList[0]?.url
        hotelPopupImageViewController.hotelImage = hotelImageView.image

        hotelPopupImageViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        print(hotel?.hotelImageList[0]?.url)
        self.present(hotelPopupImageViewController, animated: true)
        
    }
    
    
}
extension UILabel {
    func strikeThroughText() {
        let attributeString =  NSMutableAttributedString(string: self.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        self.attributedText = attributeString
    }
}
