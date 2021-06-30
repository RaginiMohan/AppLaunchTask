//
//  WeatherTableViewCell.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
