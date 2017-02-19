//
//  AccountViewController.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/19/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var data = DB.share().queryAccount()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellChose", for: indexPath) as? AccountTableViewCell
        cell?.imgAcc.image = UIImage(named: data[indexPath.row].image)
        cell?.lblMoney.text = "Còn : \(data[indexPath.row].money) đ"
        cell?.lblNameAcc.text = data[indexPath.row].nameAcc
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!)! as! AccountTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.size.height / 12
    }
    
    @IBAction func addAccountButton(_ sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
