//
//  UserViewController.swift
//  w409_core_data_keychain_sqlite
//
//  Created by Gautam Sharma on 22/06/23.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    private var users:[RegisterEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = DatabaseManager.getUsers()
        userTableView.reloadData();
        
    }
    
    
    @IBAction func addUserButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController else{return}
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UserViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
            
        }
        let currentUser = users[indexPath.row];
        var content = cell.defaultContentConfiguration();
        
        content.text = currentUser.name ?? "";
        content.secondaryText = currentUser.email ?? "";
        
        cell.contentConfiguration = content;
        return cell;
    }
}
