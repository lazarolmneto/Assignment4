//
//  WebService.swift
//  Assignment4
//
//  Created by Lazaro Neto on 20/12/16.
//  Copyright © 2016 Lazaro Neto. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let sharedWebservice = WebService()

//Typealias with the values of result of the webService.
typealias resultResponse = (_ value: AnyObject?, _ success: Bool, _ error : NSError?) -> Void

class WebService: NSObject {
    
    func getProfiles(result : @escaping resultResponse) {
        let url = "https://www.udemy.com/api-2.0/course-categories/?fields%5Bcourse_category%5D=@all&locale=en_GB"
        
        request(url, method: .get).responseJSON { (data) in
            if let statusCode = data.response?.statusCode{
                //Verify with status is success
                //if success return the list of profiles
                //if not, return a error
                switch statusCode{
                case 200...204:
                    print(data.result.value ?? "nil value")
                    var listCategory = [CourseCategory]()
                    
                    if let value = data.result.value{
                        if let jsonArray = JSON(value)["results"].array{
                            listCategory = jsonArray.map({ CourseCategory(from: $0) })
                        }
                    }
                    
                    result(listCategory as AnyObject?, true, nil)
                default:
                    print(data)
                    let error = NSError(domain: "", code: 1, userInfo: ["detail" : "Could not complete de operation"])
                    result(nil, false, error)
                }
            }else{
                let error = NSError(domain: "Client", code: 1, userInfo: ["detail" : "Unable to connect, please verify the status of your internet connection"])
                result(nil, false, error)
            }
        }
    }
}
