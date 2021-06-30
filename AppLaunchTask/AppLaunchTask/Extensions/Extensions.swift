//
//  Extensions.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import Foundation
import UIKit


extension UITextField{

func txtFieldUIChange(){
    let txtFld = self
    txtFld.textColor = .darkGray
    txtFld.textAlignment = .left
    txtFld.font = .setAppFontRegular(15)
    txtFld.backgroundColor = .clear
}

}

extension UILabel{

    func lblUIChange(textString: String){
    let lbl = self
    lbl.textColor = .darkGray
    lbl.textAlignment = .left
    lbl.font = .setAppFontMedium(14)
    lbl.backgroundColor = .clear
    lbl.text = textString
}

}


extension UIButton{

    func ButtonUIChange(bgColor: UIColor, titleColor: UIColor, titleString: String ){
    let Btn = self
    Btn.layer.cornerRadius = 5
    Btn.backgroundColor = bgColor
    Btn.setTitleColor(titleColor, for: .normal)
    Btn.titleLabel?.font = .setAppFontMedium(16)
    Btn.setTitle(titleString, for: .normal)
}

}

extension UIFont
{
    class func setAppFontRegular(_ size:CGFloat)->(UIFont)
    {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
    class func setAppFontMedium(_ size:CGFloat)->(UIFont)
    {
        return UIFont(name: "Roboto-Medium", size: size)!
    }
    class func setAppFontBold(_ size:CGFloat)->(UIFont)
    {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    class func setAppFontLight(_ size:CGFloat)->(UIFont)
    {
        return UIFont(name: "Roboto-Light", size: size)!
    }
}

func isValidEmail(email:String?) -> Bool {
    guard email != nil else { return false }
    let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
    return pred.evaluate(with: email)
}
