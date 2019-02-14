//
//  NetworkManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit
import SystemConfiguration

final class Reachability {
	
	static let shared = Reachability()
	//получаем результат наличия интернета
	func isConnectedToNetwork() -> Bool {
		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
		zeroAddress.sin_family = sa_family_t(AF_INET)
		
		guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
				SCNetworkReachabilityCreateWithAddress(nil, $0)
			}
		}) else {
			return true
		}
		
		var flags: SCNetworkReachabilityFlags = []
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
			return false
		}
		
		let isReachable = flags.contains(.reachable)
		let needsConnection = flags.contains(.connectionRequired)
		return (isReachable && !needsConnection)
	}
	//алерт предупреждение если нет интернета
	func alertVC(vc: UIViewController){
		let alert = UIAlertController(title: StringProject.alertNotNetwork.rawValue, message: nil, preferredStyle: .alert)
		vc.present(alert, animated: true) {
			DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
				alert.dismiss(animated: true)
			})
		}
	}
}
