//
//  UserListViewController.swift
//  AppLaunchTask
//
//  Created by pofiapple9 on 29/06/21.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var noDataLbl: UILabel!
    @IBOutlet weak var addUserBtn: UIButton!
    @IBOutlet weak var userListTbleView: UITableView!
    
    var db:DatabaseHelper = DatabaseHelper()
        
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialUISetUp()
    }
    
    func initialUISetUp(){
        
        
        titleLbl.text = "User List"
        titleLbl.textColor = .black
        titleLbl.backgroundColor = .clear
        titleLbl.font = .setAppFontMedium(17)
            
            
        noDataLbl.text = "Click  '+'  icon to add user"
        noDataLbl.textColor = .darkGray
        noDataLbl.backgroundColor = .clear
        noDataLbl.font = .setAppFontMedium(15)
        
        addUserBtn.setBackgroundImage(UIImage(named: "addIcon"), for: .normal)
        
        fetchDBData()
    }
    
    func fetchDBData(){
        users = db.read()
        if users.count != 0 {
            noDataLbl.isHidden = true
            userListTbleView.isHidden = false
            userListTbleView.delegate = self
            userListTbleView.dataSource = self
            userListTbleView.reloadData()
    
        }else{
            userListTbleView.isHidden = true
            noDataLbl.isHidden = false
        }
            
        
    }
    
    @IBAction func addUserBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserFormViewController") as! UserFormViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return users.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as? UserListTableViewCell
            
            cell?.selectionStyle = .none
            cell?.nameLbl.text = "Name: " + users[indexPath.row].firstName + " " + users[indexPath.row].lastName
            cell?.nameLbl.textColor = .darkGray
            cell?.nameLbl.backgroundColor = .clear
            cell?.nameLbl.font = .setAppFontMedium(14)
            
            cell?.emailLbl.text = "Email Id: " + users[indexPath.row].email
            cell?.emailLbl.textColor = .darkGray
            cell?.emailLbl.backgroundColor = .clear
            cell?.emailLbl.font = .setAppFontMedium(14)
           
            return cell!
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if (editingStyle == UITableViewCell.EditingStyle.delete) {
                if users.count > 0 {
                    db.deleteByID(id: users[indexPath.row].id)
                    fetchDBData()
                }
            }
        }
    }
    
}
