//
//  MapController.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation

class MapController {
	
	var delegate: MapViewController? = nil
	
	private var restAPI: RestAPI
	private var map: Map? = nil
	
	init(restAPI: RestAPI) {
		self.restAPI = restAPI
	}
	
	func fetchMap() {
		self.restAPI.onBaseURL("https://csf-geo-app.herokuapp.com").path("/api/map").onComplete(self.createMap(json:)).fetch()
	}
	
	func createMap(json: [String:Any]) {
		self.map = Map(mapJson: json)
		self.map!.create()
		if let delegate = self.delegate {
			self.map!.draw(on: delegate.mapView)
		}
	}
	
}
