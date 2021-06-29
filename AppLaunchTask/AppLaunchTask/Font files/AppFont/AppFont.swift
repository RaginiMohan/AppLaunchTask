
//  AppFont.swift

//Category Class For UIFont.Chnage the font here to change the app font
import UIKit
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
