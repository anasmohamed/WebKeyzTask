//
//  HotelLocationMapViewController.swift
//  WebKeyzTask
//
//  Created by Anas on 1/25/21.
//  Copyright © 2021 Anas. All rights reserved.
//

import UIKit
import MapKit
class HotelLocationMapViewController: UIViewController {
    @IBOutlet weak var hotelLocationMapView: MKMapView!
    var hotelName:String?
    var hotelLatitude:String?
    var hotelLongitude:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: Double(hotelLatitude!)!, longitude: Double(hotelLongitude!)!)
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        annotation.title = hotelName
        self.hotelLocationMapView.centerToLocation(initialLocation)
        self.hotelLocationMapView.addAnnotation(annotation)
        // Do any additional setup after loading the view.
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
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
