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
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var userListTbleView: UITableView!
    
    var db:DatabaseHelper = DatabaseHelper()
        
    var users:[User] = []
    
    let cellReuseIdentifier = "cell"
    
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
        
        
    }
    
   
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return users.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
            
            cell.selectionStyle = .none
            
            cell.textLabel?.text = "Name: " + users[indexPath.row].firstName + " " + users[indexPath.row].lastName
            cell.detailTextLabel?.text = "Email Id: " + users[indexPath.row].email
            
            return cell
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
