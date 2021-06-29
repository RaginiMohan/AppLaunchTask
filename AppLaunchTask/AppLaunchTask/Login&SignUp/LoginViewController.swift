//
//  LoginViewController.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 29/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        initialUISetUp()
    }
    
    //
    func initialUISetUp(){
        loginBtn.setTitle("LogIn", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor.systemPink
        loginBtn.titleLabel?.font = .setAppFontMedium(16)
        
        signUpBtn.setTitle("SignUp", for: .normal)
        signUpBtn.setTitleColor(UIColor.white, for: .normal)
        signUpBtn.backgroundColor = UIColor.systemPink
        signUpBtn.titleLabel?.font = .setAppFontMedium(16)
    }
    

    @IBAction func loginBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func signUpBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
