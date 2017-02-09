//
//  MapViewController.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import UIKit
import Mapbox

class MapViewController: UIViewController, MGLMapViewDelegate {
	
	struct Constant {
		static let cegepCenter = CLLocationCoordinate2D(latitude: 46.78642133499, longitude: -71.28739276585)
	}
	
	// MARK: - IB outlets

	@IBOutlet var mapView: MGLMapView!
	
	// MARK: - Outlets
	
	var mapController: MapController!
	
	// MARK: - View controller methods
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let restAPI = RestAPI(URLSessionConfiguration.default)
		self.mapController = MapController(restAPI: restAPI)
		self.mapController.delegate = self
		
		self.setUpMap()
		
		self.mapController.fetchMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// Map
	
	func mapView(_ mapView: MGLMapView, lineWidthForPolylineAnnotation annotation: MGLPolyline) -> CGFloat {
		return 2.0
	}
	
	// MARK: - Set up methods
	
	private func setUpMap() {
		self.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		self.mapView.setCenter(Constant.cegepCenter, zoomLevel: 16, animated: false)
	}

}
