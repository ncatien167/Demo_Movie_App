//
//  Movie.swift
//  Demo_App
//
//  Created by Apple on 11/17/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class Movie {
    
    var poster: UIImage!
    var title: String!
    var year: String!
    var type: String!
    var info: String!
    
    init(poster: UIImage, title: String, year: String, type:String, info: String) {
        self.poster = poster
        self.title = title
        self.year = year
        self.type = type
        self.info = info
    }
    
}

