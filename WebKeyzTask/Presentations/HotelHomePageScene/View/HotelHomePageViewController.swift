//
//  HotelHomePageViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit


let hotelHomePageCollectionViewCellIdentifier = "HotelHomePageCollectionViewCell"
class HotelHomePageViewController: UIViewController,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var hotelsCollectionView: UICollectionView!
    
    var hotelHomePagePresenter : HotelHomePagePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelHomePagePresenter = HotelHomePagePresenter(hotelHomePageProtocol: self)
        hotelsCollectionView.delegate = self
        hotelsCollectionView.dataSource = self
        hotelHomePagePresenter.getHotels()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    func setupCollectionView()  {
        hotelsCollectionView.register(UINib(nibName: hotelHomePageCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: hotelHomePageCollectionViewCellIdentifier)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelHomePagePresenter.hotelsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: hotelHomePageCollectionViewCellIdentifier, for: indexPath) as! HotelHomePageCollectionViewCell
        hotelHomePagePresenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hotelDetailsStoryboard = UIStoryboard.init(name: "HotelDetails", bundle: nil)
        let hotelDetailViewController = hotelDetailsStoryboard.instantiateViewController(withIdentifier: "HotelDetailViewController") as! HotelDetailViewController
        hotelDetailViewController.hotel = hotelHomePagePresenter.hotel(index: indexPath.row)
        self.navigationController!.pushViewController(hotelDetailViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        width = 150
        height = 150
        return CGSize(width: width, height: height)
        
    }
}
