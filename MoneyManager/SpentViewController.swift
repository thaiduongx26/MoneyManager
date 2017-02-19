//
//  SpentViewController.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/17/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit
import RealmSwift
protocol spentVC {
    func reloadData()
}

class SpentViewController: UIViewController,UITableViewDataSource, UITableViewDelegate , spentVC {
    
    internal func reloadData(){
        data = DB.share().queryIndex()
        //print(data)
        tableView.reloadData()
    }
    
    @IBOutlet var tableView: UITableView!
    var delegate : recordsViewController? = nil
    
    @IBOutlet var addButton: UIButton!
    @IBOutlet var backButton: UIButton!
    var data = DB.share().queryIndex()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addDidTap(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddSpentVC") as! AddSpentViewController
        secondViewController.delegate = self as! spentVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].dadName
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].childName.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ElementCell")
        cell.textLabel?.text = data[indexPath.section].childName[indexPath.row].childName
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 16)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        print(currentCell.textLabel!.text!)
        self.delegate?.sendValue(value: (currentCell.textLabel?.text)!, view: "SpentVC")
        self.navigationController?.popViewController(animated: true)
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
