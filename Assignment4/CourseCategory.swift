//
//  CourseCategory.swift
//  Assignment4
//
//  Created by Lazaro Neto on 20/12/16.
//  Copyright © 2016 Lazaro Neto. All rights reserved.
//

import UIKit
import SwiftyJSON

class CourseCategory: NSObject {

//    JSON MODEL
    
//    "_class":"course_category",
//    "id":300,
//    "title":"Academics",
//    "title_cleaned":"Academics",
//    "channel_id":1652,
//    "sort_order":135,
//    "icon_class":"udi udi-academics",
//    "icon_code":"e601",
//    "url":"/courses/academics/"
    
    var id :                    Int! = -1
    var channedId :             Int! = -1
    var sortOrder :             Int! = -1
    var iconCode :              Int! = -1
    var title :                 String! = ""
    var titleCleaned :          String! = ""
    var iconClass :             String! = ""
    var url :                   String! = ""
    
    init(from json : JSON){
        id              = json["id"].intValue
        channedId       = json["channel_id"].intValue
        sortOrder       = json["sort_order"].intValue
        iconCode        = json["icon_code"].intValue
        title           = json["title"].stringValue
        titleCleaned    = json["title_cleaned"].stringValue
        iconClass       = json["icon_class"].stringValue
        url             = json["url"].stringValue
    }
    
}
