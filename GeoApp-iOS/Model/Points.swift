//
//  Points.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-09.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation

class Point {
	
	var title: String
	var description: String?
	var point: (lat: Double, lng: Double)
	
	init(_ point: (Double, Double), with title: String, and description: String? = nil) {
		self.point = point
		self.title = title
		self.description = description
	}
	
}

class Door: Point {
	
	override init(_ point: (Double, Double), with title: String, and description: String? = nil) {
		super.init(point, with: title, and: description)
	}
	
}
