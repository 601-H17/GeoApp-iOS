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
	
	var restAPI: RestAPI
	
	init(restAPI: RestAPI) {
		self.restAPI = restAPI
	}
	
	func fetchMap(onComplete: @escaping ([String:Any]) -> Void, onFailure: @escaping (String) -> Void) {
		self.restAPI.onBaseURL("https://csf-geo-app.herokuapp.com").path("/api/map").fetch(onComplete: onComplete, onFailure: onFailure)
	}
	
	func createMap(json: [String:Any]) -> Map {
		let map = Map(mapJson: json)
		map.create()
		return map
	}
	
}
