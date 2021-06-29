//
//  WeatherViewController.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchWeatherReport()
        
    }
    
    func fetchWeatherReport() {
        
      
        let stringURL = "https://api.openweathermap.org/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=imperial&appid=b143bb707b2ee117e62649b358207d3e"
       
        APIManager.apiGetWithToken(serviceName: stringURL, parameters: nil) { (json:NSDictionary?, error:NSError?) in
            DispatchQueue.main.async { self.showAnimatedLoader(isAnimated: false) }
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            print(json!)
//            if json?.value(forKey: "status") as! NSNumber == 200 {
                let reviewsArray:NSArray = json?.value(forKey: "data") as! NSArray
                print(reviewsArray)
//            }
//            else {
//                self.showInformation(title: "Torripo", message: json?.value(forKey: "message") as! String)
//            }
        }
    }
}
