//
//  ApiManager.swift
//  Demo_App
//
//  Created by Apple on 11/20/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

typealias ApiCompletion = (ApiResponse?, NSError?) -> Void

public enum ApiMethod: String {
    case GET, POST, PUT
}

public struct ApiManager {
    
    fileprivate static func getBaseApiUrl() -> String {
        return BaseUrl
    }
    
    
    
}
