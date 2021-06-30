//
//  UserFormViewController.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 30/06/21.
//

import UIKit

class UserFormViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var db:DatabaseHelper = DatabaseHelper()
    
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUISetUp()
    }
    
    func initialUISetUp(){
        
        
        titleLbl.text = "User Form"
        titleLbl.textColor = .darkGray
        titleLbl.backgroundColor = .clear
        titleLbl.font = .setAppFontMedium(17)
        
        firstNameTxtField.txtFieldUIChange()
        firstNameTxtField.placeholder = "First Name"
        firstNameTxtField.delegate = self
        
        lastNameTxtField.txtFieldUIChange()
        lastNameTxtField.placeholder = "Last Name"
        lastNameTxtField.delegate = self
        
        emailTxtField.txtFieldUIChange()
        emailTxtField.placeholder = "Email ID"
        emailTxtField.delegate = self
        
        saveBtn.ButtonUIChange(bgColor: .systemPink, titleColor: .white, titleString: "Save")
        cancelBtn.ButtonUIChange(bgColor: .white, titleColor: .systemPink, titleString: "Cancel")
        cancelBtn.layer.borderColor = UIColor.systemPink.cgColor
        cancelBtn.layer.borderWidth = 0.7
        
        
    }
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if firstNameTxtField.text == "" {
            showAlert(with: "Please enter your first name")
        } else if lastNameTxtField.text == ""  {
            showAlert(with: "Please enter your last name")
        } else if emailTxtField.text == ""  {
            showAlert(with: "Please enter your email id")
        }else if isValidEmail(email: emailTxtField.text) == false{
            showAlert(with: "Please enter a valid email id")
        }
        
        else {
            
            if let getUserId = UserDefaults.standard.value(forKey: "userid") as? Int {
                UserDefaults.standard.setValue(getUserId + 1 , forKey: "userid")
            } else {
                UserDefaults.standard.setValue(1, forKey: "userid")
            }
            
            let userEMail = users.filter { $0.email == emailTxtField.text}
            
            if userEMail.count > 0 {
                showAlert(with: "Sorry, this mail already registered")
            } else {
                db.insert(id: UserDefaults.standard.value(forKey: "userid") as? Int ?? 1, email: emailTxtField.text ?? "", firstName: firstNameTxtField.text ?? "", lastName: lastNameTxtField.text ?? "")
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
    
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(with message: String)
    {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { action -> Void in
            
        })
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

extension UserFormViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == firstNameTxtField{
            firstNameTxtField.resignFirstResponder()
            lastNameTxtField.becomeFirstResponder()
        }else if textField == lastNameTxtField{
            lastNameTxtField.resignFirstResponder()
            emailTxtField.becomeFirstResponder()
        }else{
            emailTxtField.resignFirstResponder()
        }
        return true
    }
}
