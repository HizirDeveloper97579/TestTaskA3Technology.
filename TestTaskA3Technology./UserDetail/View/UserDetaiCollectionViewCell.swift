//
//  UserDetaiCollectionViewCell.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class UserDetaiCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var photoImageView   : UIImageView!
	@IBOutlet weak var viewImageView    : UIView!
	@IBOutlet weak var tittleLabel      : UILabel!
	@IBOutlet weak var activityLoadPhoto: UIActivityIndicatorView!
	private var proxy = Proxy(loadObject: PhotoLoad(), cache: CacheManager<UIImage>())
	
	public var photo: Photo? {
		didSet{
			tittleLabel.text = photo?.title
			proxy.loadImage(urlString: photo?.url) {  [unowned self] (image) in
				self.photoImageView.image = image
				self.activityLoadPhoto.show(on: false)
			}
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		activityLoadPhoto.show(on: true)
		photoImageView.addShadowAndRoundedCorners()
		viewImageView.addShadowAndRoundedCorners()
	}
}
