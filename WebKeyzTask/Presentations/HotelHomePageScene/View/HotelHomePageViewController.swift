//
//  HotelHomePageViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit


let hotelHomePageTableViewCellIdentifier = "HotelHomePageTableViewCell"
class HotelHomePageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var hotelsTableView: UITableView!
    
    var hotelHomePagePresenter : HotelHomePagePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelHomePagePresenter = HotelHomePagePresenter(hotelHomePageProtocol: self)
        hotelsTableView.delegate = self
        hotelsTableView.dataSource = self
        hotelHomePagePresenter.getHotels()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    func setupTableView()  {
        hotelsTableView.register(UINib(nibName: hotelHomePageTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: hotelHomePageTableViewCellIdentifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelHomePagePresenter.hotelsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: hotelHomePageTableViewCellIdentifier, for: indexPath) as! HotelHomePageTableViewCell
        hotelHomePagePresenter.configure(cell: cell, for: indexPath.row)
        return cell
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
