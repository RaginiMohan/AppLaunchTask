//
//  WeatherViewController.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var weatherTblView: UITableView!
    
    var currentDataDic = NSDictionary()
    var dailyDataDic = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUISetUp()
        
    }
    
    func initialUISetUp(){
        
        weatherTblView.isHidden = true
        
        titleLbl.text = "Weather Report"
        titleLbl.textColor = .black
        titleLbl.backgroundColor = .clear
        titleLbl.font = .setAppFontMedium(17)
        
        backBtn.setImage(UIImage(named: "backIcon"), for: .normal)
        
        logoutBtn.ButtonUIChange(bgColor: .white, titleColor: .systemPink, titleString: "Logout")
        logoutBtn.titleLabel?.font = .setAppFontMedium(13)
        logoutBtn.layer.borderColor = UIColor.systemPink.cgColor
        logoutBtn.layer.borderWidth = 0.7
        
        fetchWeatherReport()
    }
    
    func fetchWeatherReport() {
        
        
        let stringURL = "https://api.openweathermap.org/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=imperial&appid=b143bb707b2ee117e62649b358207d3e"
        
        
        APIManager.apiGet(serviceName: stringURL, parameters: nil) { (json:NSDictionary?, error:NSError?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            print(json!)
            
            self.currentDataDic = json?.value(forKey: "current") as! NSDictionary
            print(self.currentDataDic)
            self.dailyDataDic = json?.object(forKey: "hourly") as! NSArray
            
            
            print(self.dailyDataDic)
            
            self.weatherTblView.delegate = self
            self.weatherTblView.dataSource = self
            
            self.weatherTblView.isHidden = false
            
            self.weatherTblView.reloadData()
            
        }
        
    }
    
    @IBAction func logoutBtnAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch(section) {
        case 1:return "Tomorrow"
        default :return "Today"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0{
            return 1
        }else{
            return dailyDataDic.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as? WeatherTableViewCell
        
        cell?.selectionStyle = .none
        
        if indexPath.section == 0{
            
            cell?.tempLbl.lblUIChange(textString: "Temp: \(currentDataDic.value(forKey: "temp") ?? "")")
            cell?.humidityLbl.lblUIChange(textString: "Humidity: \(currentDataDic.value(forKey: "humidity") ?? "")")
            cell?.weatherTypeLbl.lblUIChange(textString: "Weather: " + (((self.currentDataDic.object(forKey: "weather") as! NSArray).object(at: 0) as? NSDictionary)?.value(forKey: "description") as! String))
            cell?.windSpeedLbl.lblUIChange(textString: "Wind Speed: \(currentDataDic.value(forKey: "wind_speed") ?? "")")
            
        }else{
            cell?.tempLbl.lblUIChange(textString: "Temp: \((dailyDataDic.object(at: indexPath.row)as! NSDictionary).value(forKey: "temp") ?? "" )")
            cell?.humidityLbl.lblUIChange(textString: "Humidity: \((dailyDataDic.object(at: indexPath.row)as! NSDictionary).value(forKey: "humidity") ?? "" )")
            cell?.weatherTypeLbl.lblUIChange(textString: "Weather: " + ((((dailyDataDic.object(at: indexPath.row)as! NSDictionary).object(forKey: "weather") as! NSArray).object(at: 0) as? NSDictionary)?.value(forKey: "description") as! String))
            
            cell?.windSpeedLbl.lblUIChange(textString: "Wind Speed: \((dailyDataDic.object(at: indexPath.row)as! NSDictionary).value(forKey: "wind_speed") ?? "" )")
        }
        return cell!
    }
    
}

