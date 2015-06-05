//
//  ViewModel.swift
//  EnumTable
//
//  Created by Bart Whiteley on 6/5/15.
//  Copyright (c) 2015 whiteley.org. All rights reserved.
//

import UIKit


enum Row {
    case Twitter, Facebook, Instagram, Contact, Settings
    
    
    var displayName:String {
        switch self {
        case .Twitter:
            return NSLocalizedString("Twitter", comment:"")
        case .Facebook:
            return NSLocalizedString("Facebook", comment:"")
        case .Instagram:
            return NSLocalizedString("Instagram", comment:"")
        case .Contact:
            return NSLocalizedString("Contact us", comment:"")
        case .Settings:
            return NSLocalizedString("Advanced Settings", comment:"")
        }
    }
    
    var icon:UIImage? {
        let imageName:String
        switch self {
        case .Twitter:
            imageName = "twitter"
        case .Facebook:
            imageName = "facebook"
        case .Instagram:
            imageName = "instagram"
        case .Contact:
            imageName = "phone"
        case .Settings:
            imageName = "gear"
        }
        return UIImage(named: imageName)
    }
    
    var URL:String? {
        switch self {
        case .Twitter:
            return "http://twitter.com"
        case .Facebook:
            return "http://facebook.com"
        case .Instagram:
            return "http://instagram.com"
        default:
            return nil
        }
    }
    
}


class TableViewModel {
    
    let schema:[(sectionTitle:String, rows:[Row])] = [
        (NSLocalizedString("Social", comment:""), [.Facebook, .Instagram, .Twitter]),
        (NSLocalizedString("Other", comment:""), [.Contact, .Settings])]
    
}