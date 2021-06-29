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

    class func apiGetWithToken(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
        print("BASE URL : \(serviceName as String)")
        print("PARAMETER : \(parameters!)")
        
       
        let postheaders : HTTPHeaders = ["Authorization" : ""]
        Alamofire.request(serviceName, method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: postheaders).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    let json = data as? NSDictionary
                    completionHandler(json,nil)
                }
                break
            case .failure(_):
                completionHandler(nil,response.result.error as NSError?)
                break
                
            }
        }
    }

}
