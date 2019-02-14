//
//  JSONManager.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import Foundation

final class JSONManager {
	
	static let shared = JSONManager()
	private init(){}
	
	
	private func parse(urlString: String, complition: @escaping Clousure<Data>){
		guard let url  = URL(string: urlString) else { return }
		let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 0)
		let dataTask   = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			guard error == nil else { return }
			guard let data  = data else { return}
			complition(data)
	}
	dataTask.resume()
	}
	
	func parseUsers(complition: @escaping Clousure<[User]>){
		
		self.parse(urlString: URL_API.users.rawValue) {(data) in
			do{
				let getUsers = try JSONDecoder().decode([User].self, from: data)
				DispatchQueue.main.async {
				complition(getUsers)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
	func parsePhotos(id: Double?, complition: @escaping Clousure<[Photo]>){
		guard let id = id else { return }
		self.parse(urlString: URL_API.photo.rawValue) {(data) in
			do{
				let getPhotos = try JSONDecoder().decode([Photo].self, from: data).filter({ $0.albumId == id})
				DispatchQueue.main.async {
				complition(getPhotos)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
}


