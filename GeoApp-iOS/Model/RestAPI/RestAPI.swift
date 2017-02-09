//
//  RestAPI.swift
//  GeoApp-iOS
//
//  Created by Benoît Lévesque on 2017-02-06.
//  Copyright © 2017 Genius Production. All rights reserved.
//

import Foundation
import UIKit

class RestAPI {
	
	enum Response {
		case string, json
	}
	
	private var context: UIViewController?
	
	private var session: URLSession
	private var url: String = ""
	private var onComplete: (([String:Any]) -> Void)!
	private var onFailure: ((String) -> Void)!
	
	init(_ config: URLSessionConfiguration, context: UIViewController? = nil) {
		config.httpAdditionalHeaders = ["Authorization": "Token token=\(RestAPI.apiKey(named: "API_SECRET"))"]
		self.session = URLSession(configuration: config)
		self.context = context
		self.onFailure = defaultOnFailure(message:)
	}
	
	func onBaseURL(_ url: String) -> RestAPI {
		self.url = url
		return self
	}
	
	func path(_ path: String) -> RestAPI {
		self.url += path.hasPrefix("/") ? path : "/\(path)"
		return self
	}
	
	func fetch() {
		let url = URL(string: self.url)!
		
		let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
			
			if let error = error {
				print("error")
				print(error.localizedDescription)
				self.onFailure(error.localizedDescription)
			} else {
				print("json")

				if let json = Serializer.serializeJson(with: data!) {
					self.onComplete(json)
				} else {
					self.onFailure("There was an error in json (json is nil)")
				}
			}
			
		})
		task.resume()
	}
	
	func onComplete(_ complete: @escaping ([String:Any]) -> Void) -> RestAPI {
		self.onComplete = complete
		return self
	}
	
	func onFailure(_ failure: @escaping (String) -> Void) -> RestAPI {
		self.onFailure = failure
		return self
	}
	
	private func defaultOnFailure(message: String) {
		print("Error: \(message)\nNeed to present a alert here...")
	}
	
	private func validate(_ url: String) -> Bool {
		return url.hasPrefix("https://") && url.contains(".com")
	}
	
	private static func apiKey(named key: String) -> String {
		let pathfile = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
		let plist = NSDictionary(contentsOfFile: pathfile!)
		return plist?.object(forKey: key) as! String
	}
	
}
