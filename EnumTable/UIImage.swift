//
//  UIImage.swift
//  EnumTable
//
//  Created by Bart Whiteley on 6/17/15.
//  Copyright © 2015 whiteley.org. All rights reserved.
//

import UIKit

extension UIImage {
    enum AssetIdentifier:String {
        case Facebook = "facebook"
        case Twitter = "twitter"
        case Instagram = "instagram"
        case Gear = "gear"
        case Phone = "phone"
        case User = "user"
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
