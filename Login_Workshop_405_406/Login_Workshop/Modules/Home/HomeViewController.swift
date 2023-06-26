//
//  HomeViewController.swift
//  Login_Workshop
//
//  Created by Gautam Sharma on 19/06/23.
//

import Foundation
import UIKit

class HomeViewController : UIViewController , UITableViewDataSource {
    
    
    
    //UITableViewDataSource- ensure that this class provide the data sorce for the table cell
    @IBOutlet weak var table: UITableView!; //ib stands for interface builder
    
    struct OrderSummary{
        let orderNo : String
        let orderName : String;
    }
    
    let data: [OrderSummary] = [
        OrderSummary(orderNo: "Order No. 1728029",orderName: "ABC Corporation"),
        OrderSummary(orderNo: "order No. 2728028" , orderName: "ABC Corporation")
    ]
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad();
        
        self.title = "Dashboard";
        // Set the title color to white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        // Show the navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.backgroundColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.red
        
        let statusBarView = UIView()
        statusBarView.backgroundColor = .red // set the status bar background color to red
        view.addSubview(statusBarView)
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil);
        let sideBar = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: nil)
        searchButton.tintColor = .white;
        sideBar.tintColor = .white;
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = sideBar
        
        
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  dataRow = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier:"cell",for: indexPath) as! HomeTableViewCell;
        cell.orderNo.text = dataRow.orderNo;
        cell.orderName.text = dataRow.orderName;
        return cell
    }
    
}
