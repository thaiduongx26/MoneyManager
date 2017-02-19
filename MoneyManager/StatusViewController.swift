//
//  StatusViewController.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/19/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    var delegate : recordsViewController? = nil
    
    @IBOutlet var tfStatus: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneDidTap(_ sender: UIButton) {
        self.delegate?.sendValue(value: tfStatus.text!, view: "StatusVC")
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func backDidTap(_ sender: UIButton) {
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
extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
