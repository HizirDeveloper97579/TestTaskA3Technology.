//
//  Session.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 18/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

protocol Session {
	
	//переводим данные в нужный формат Image/JSON
	func loadData(urlString: String? , complition: @escaping Clousure<Any> )
	//получает данные из интернета
	func session(urlString: String?, complition: @escaping Clousure<Data>)
}

extension Session {
	
	func session(urlString: String?, complition: @escaping Clousure<Data>){
		guard let urlString = urlString else { return }
		guard let url  = URL(string: urlString) else { return }
		let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 0)
		let dataTask   = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			guard error == nil else { return }
			guard let data  = data else { return}
			complition(data)
		}
		dataTask.resume()
	}
}
