//
//  RestAPI.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation

class RestAPI {
	
	enum Response {
		case string, json
	}
	
	static let shared = RestAPI()
	
	private var session: URLSession
	private var url: String = ""
	
	private init() {
		let config = URLSessionConfiguration.default
		self.session = URLSession(configuration: config)
	}
	
	func onBaseURL(_ url: String) -> RestAPI {
		self.url = url
		return RestAPI.shared
	}
	
	func path(_ path: String) -> RestAPI {
		self.url += path.hasPrefix("/") ? path : "/\(path)"
		return RestAPI.shared
	}
	
	func fetch() {
		let url = URL(string: self.url)!
		
		let task = session.dataTask(with: url, completionHandler: {
			(data, response, error) in
			
			if let error = error {
				
				print(error.localizedDescription)
				
			} else {
				
				do {
					
					if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
						print((json["features"] as! [Any])[0])
					}
					
				} catch let e {
					print("error in JSONSerialization: \(e.localizedDescription)")
				}
				
				
			}
			
		})
		task.resume()
	}
	
	private func validate(_ url: String) -> Bool {
		return url.hasPrefix("https://") && url.contains(".com")
	}
	
}
