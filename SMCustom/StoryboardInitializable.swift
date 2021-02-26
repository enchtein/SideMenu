//
//  StoryboardInitializable.swift
//  SMCustom
//
//  Created by Track Ensure on 2021-02-25.
//

import Foundation
import UIKit

protocol StoryboardInitializable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    
    static func createFromStoryboard() -> Self
}

extension StoryboardInitializable where Self : UIViewController {
    
    static var storyboardName: String {
        return "Login"
    }
    
    static var storyboardBundle: Bundle? {
        return nil
    }
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func createFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
    
}

//extension StoryboardInitializable where Self : CollectionTextFieldsViewController {
//    static var storyboardName: String {
//        return "Collection"
//    }
//
//}
