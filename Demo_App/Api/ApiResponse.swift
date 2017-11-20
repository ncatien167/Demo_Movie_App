//
//  ApiResponse.swift
//  Demo_App
//
//  Created by Apple on 11/20/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ApiResponse {
    
    var data:JSON!
    var message: String!
    var errors = [String]()
    
    init(data: JSON!) {
        self.data = data
        self.message = data["message"].stringValue
        let ers = data["errors"].arrayValue
        for er in ers {
            self.errors.append(er.stringValue)
        }
    }
    
}
