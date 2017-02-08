//
//  Map.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-07.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation
import Mapbox

class Map {
	
	private var mapJson: [String:Any]
	private var mapLines: [MGLPolyline] = []
	
	init(mapJson map: [String:Any]) {
		self.mapJson = map
	}
	
	func create() {
		let features = self.mapJson["features"] as! [Any]
		
		for feature in features {
			let f = feature as! [String:Any]
			if let geometry = f["geometry"] as? [String:Any] {
				if let type = geometry["type"] as? String, type == "LineString" {
					guard let coordinates = geometry["coordinates"] as? [[Double]] else { continue }
					var linesPts: [CLLocationCoordinate2D] = []
					coordinates.forEach({ (coordinate) in
						let coord = CLLocationCoordinate2D(latitude: coordinate[1], longitude: coordinate[0])
						linesPts.append(coord)
					})
					
					let line = MGLPolyline(coordinates: &linesPts, count: UInt(linesPts.count))
					self.mapLines.append(line)
				}
			}
		}
		print("done create")
	}
	
	func draw(on mapView: MGLMapView) {
		if !self.mapLines.isEmpty {
			self.mapLines.forEach({ (line) in
				DispatchQueue.main.async(execute: { 
					[unowned mapView] in mapView.addAnnotation(line)
				})
			})
		}
	}
	
}
