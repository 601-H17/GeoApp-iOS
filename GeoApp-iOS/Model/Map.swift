//
//  Map.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-07.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation

class Map {
	
	private var mapJson: [String:Any]
	private var map: [MapPoint] = []
	
	init(mapJson map: [String:Any]) {
		self.mapJson = map
	}
	
	func create() {
		let features = self.mapJson["features"] as! [Any]
		print(features)
		
		for feature in features {
			if let geometry = (feature as! [String:Any])["geometry"] {
//				let type = 
			}
		}
	}
	
}

class MapPoint {
	
}
