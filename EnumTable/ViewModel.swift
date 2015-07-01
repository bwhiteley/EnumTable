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
    case FirstName(String)
    case LastName(String)
    
    
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
        case let .FirstName(name):
            return name
        case let .LastName(name):
            return name
        }
    }
    
    var icon:UIImage? {
        let assetId:UIImage.AssetIdentifier
        switch self {
        case .Twitter:
            assetId = .Twitter
        case .Facebook:
            assetId = .Facebook
        case .Instagram:
            assetId = .Instagram
        case .Contact:
            assetId = .Phone
        case .Settings:
            assetId = .Gear
        case .FirstName:
            assetId = .User
        case .LastName:
            assetId = .User
        }
        return UIImage(assetIdentifier: assetId)
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
        (NSLocalizedString("Other", comment:""), [.Contact, .Settings]),
        (NSLocalizedString("About You", comment:""), [.FirstName("John"), .LastName("Appleseed")])]
    
}