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
	
	func fetch(onComplete complete: @escaping ([String:Any]) -> Void, onFailure failure: @escaping (String) -> Void ) {
		let url = URL(string: self.url)!
		
		let task = session.dataTask(with: url, completionHandler: {
			(data, response, error) in
			
			if let error = error {
				print(error.localizedDescription)
				failure(error.localizedDescription)
			} else {
				if let json = Serializer.serializeJson(with: data!) {
					complete(json)
				} else {
					failure("There was an error in json (json is nil)")
				}
			}
			
		})
		task.resume()
	}
	
	private func validate(_ url: String) -> Bool {
		return url.hasPrefix("https://") && url.contains(".com")
	}
	
}
