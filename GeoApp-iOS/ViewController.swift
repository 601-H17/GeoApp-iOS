//
//  ViewController.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import UIKit

import Mapbox

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let mapView = MGLMapView(frame: self.view.bounds)
		mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		let center = CLLocationCoordinate2D(latitude: 46.78642133499, longitude: -71.28739276585)
		mapView.setCenter(center, zoomLevel: 16, animated: false)
		
		self.view.addSubview(mapView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

