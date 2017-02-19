//
//  AddSpentViewController.swift
//  MoneyManager
//
//  Created by Thai Duong on 2/18/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

protocol addVC {
    func setData(str: String)
}

class AddSpentViewController: UIViewController,addVC {
    var delegate : spentVC? = nil
    
    internal func setData(str: String){
        lblParent.text = str
    }
    
    @IBOutlet var viewParent: UIView!
    @IBOutlet var tfName: UITextField!
    
    @IBOutlet var lblParent: UILabel!
    @IBOutlet var tfStatus: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblParent.text = ""
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.viewParent.addGestureRecognizer(gesture)
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func someAction(_ sender:UITapGestureRecognizer){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ParentVC") as! ParentViewController
        secondViewController.delegate = self as? addVC
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    @IBAction func doneDidTap(_ sender: UIButton) {
        if checkBoo() {
            let child = ChildIndex()
            child.childName = tfName.text!
            child.status = tfStatus.text!
            DB.share().insertChildToParentIndex(parentName: lblParent.text!, child: child)
            self.delegate?.reloadData()
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Ops!!", message: "Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func checkBoo() -> Bool {
        var boo = true
        if tfName.text == "" || lblParent.text == ""{
            boo = false
        }
        return boo
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
