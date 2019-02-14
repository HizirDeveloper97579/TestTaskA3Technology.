//
//  UserDetailViewController.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
	//MARK: --- VARIBELS
	public var curenUser   : User!
	private var userPhotos = [Photo]()
	let parsePhoto = ParseJSONPhotos()
	//MARK: --- OUTLETS
	@IBOutlet weak var userDetailCollectionView: UICollectionView!
	//MARK: --- LOAD
	override func viewDidLoad() {
		super.viewDidLoad()
		settingSelfController()
	}
	//MARK: --- FUNCTIONS
	private func settingSelfController(){
		let jsonParse = ParseJSON(parseJSON: parsePhoto)
		jsonParse.parseJSON(url: URL_API.photo.rawValue, id: curenUser.id) { (photos) in
			self.userPhotos = photos as! [Photo]
			self.userDetailCollectionView.reloadData()
		}
	}
}

//MARK: --- DataSorce
extension UserDetailViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return userPhotos.count
	}
}
//MARK: --- Delegate 
extension UserDetailViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserDetaiCollectionViewCell.identifire , for: indexPath) as! UserDetaiCollectionViewCell
		cell.photo = userPhotos[indexPath.row]
		return cell
	}
}
//MARK: --- Autolayaut cell
extension UserDetailViewController:  UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
		let width : CGFloat = collectionView.frame.width - 30
		let height: CGFloat = width + 30
		return CGSize(width: width, height: height)
	}
}
//MARK: --- END -----------------------------------------------------------

