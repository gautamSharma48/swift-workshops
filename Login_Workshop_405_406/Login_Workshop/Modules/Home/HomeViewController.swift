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
        
        // Set the navigation title
        self.title = "Dashboard"
        // Show the navigation bar
        navigationController?.setNavigationBarHidden(false, animated: true)
        //navigationController?.navigationBar.backgroundColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.red
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil);
        navigationItem.rightBarButtonItem = searchButton
        
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
