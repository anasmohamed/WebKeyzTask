//
//  HotelPopupImageViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import Kingfisher
class HotelPopupImageViewController: UIViewController {
    @IBOutlet weak var hotelPhotoImageView: UIImageView!
    var hotelImage : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelPhotoImageView.image = hotelImage
        let hotelImageViewTap = UITapGestureRecognizer(target: self, action: #selector(handleHotelImageTapped(tapGestureRecognizer:)))
        hotelPhotoImageView.addGestureRecognizer(hotelImageViewTap)
    }
    @objc func handleHotelImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
        self.dismiss(animated: true, completion: nil)
           
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
