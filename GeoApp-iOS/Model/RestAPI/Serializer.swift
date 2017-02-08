//
//  Serializer.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation

class Serializer {
	
	class func serializeJson(with object: Any) -> [String: Any]? {
		do {
			
			let data = try JSONSerialization.data(withJSONObject: object, options: [])
			return Serializer.serializeJson(with: data)
			
		} catch let e {
			print("error in JSONSerialization: \(e.localizedDescription)")
			return nil
		}
	}
	
	class func serializeJson(with data: Data) -> [String: Any]? {
		do {
			
			if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
				return json
			}
			return nil
			
		} catch let e {
			print("error in JSONSerialization: \(e.localizedDescription)")
			return nil
		}
	}
	
}


