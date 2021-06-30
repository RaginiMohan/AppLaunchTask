//
//  APIManager.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import Foundation
import UIKit
import Alamofire

class APIManager: NSObject {
    
    
    class func apiGet(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
        AF.request(serviceName, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:AFDataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if let data = response.value{
                    let json = data as? NSDictionary
                    completionHandler(json,nil)
                }
                break
            case .failure(_):
                completionHandler(nil,response.error as NSError?)
                break
                
            }
        }
    }
    
}
