//
//  ParentViewController.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/18/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var delegate : addVC? = nil
    let data = DB.share().queryIndex()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ParentCell")
        cell.textLabel?.text = data[indexPath.row].dadName
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        print(currentCell.textLabel!.text!)
        self.delegate?.setData(str: currentCell.textLabel!.text!)
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
