//
//  UIImageView + Extension.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-04.
//

import UIKit
import Kingfisher

extension UIImageView{
    func SetImage(With urlString: String){
        guard let url = URL.init(string: urlString) else{
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
