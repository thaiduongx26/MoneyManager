//
//  RecordsViewController.swift
//  MoneyManager
//
//  Created by ThaiDuong on 2/15/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

protocol recordsViewController
{
    func sendValue( value : String,view:String)
}

class RecordsViewController: UIViewController , recordsViewController{
    
    internal func sendValue(value: String , view : String) {
        print(value)
        if view == "CalVC" {
            lblMoney.text = value
        } else if view == "SpentVC" {
            lblSpent.text = value
        }else if view == "StatusVC" {
            lblStatus.text = value
        }else if view == "ChoseAccVC" {
            lblFromAcc.text = value
        }
    }

    
    
    @IBOutlet var eventSpentView: BaseView!
    @IBOutlet var spentForView: BaseView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var fromAccView: BaseView!
    @IBOutlet var statusView: BaseView!
    @IBOutlet var spentView: BaseView!
    @IBOutlet var calView: BaseView!
    
    @IBOutlet var lblSpent: UILabel!
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet var lblFromAcc: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblMoney: UILabel!
    
    @IBOutlet var tfSpentFor: UITextField!
    
    @IBOutlet var tfEvent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsDisplay()
        self.hideKeyboard()
        // Do any additional setup after loading the view.
        setUpUI()
        // get the current date and time
        let currentDateTime = Date()
        
        // get the user's calendar
        let userCalendar = Calendar.current
        
        // choose which date and time components are needed
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second
        ]
        
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
        
        print(dateTimeComponents.year!)
        print(dateTimeComponents.month!)
        print(dateTimeComponents.day!)
        lblDate.text = "\(dateTimeComponents.day!)/\(dateTimeComponents.month!)/\(dateTimeComponents.year!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func defaultInfo(){
        
        lblMoney.text = "Số tiền"
        lblSpent.text = ""
        lblStatus.text = ""
        lblFromAcc.text = ""
        lblDate.text = ""
    }
    
    func setUpUI() {
        defaultInfo()
        self.calView.name = "CalVC"
        self.spentView.name = "SpentVC"
        self.statusView.name = "StatusVC"
        self.fromAccView.name = "ChoseAccVC"
    }

    @IBAction func writeDidTap(_ sender: UIButton) {
        if check() {
            let record = Record()
            record.money = Int(lblMoney.text!)!
            record.spent = lblSpent.text!
            record.date = lblDate.text!
            record.spentFor = tfSpentFor.text!
            record.event = tfEvent.text!
            record.status = lblStatus.text!
            DB.share().saveRecord(record: record)
        } else {
            let alert = UIAlertController(title: "Ops!!", message: "Thiếu rồi !", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func check() -> Bool {
        var boo : Bool = false
        if(Int(lblMoney.text!)! > 0 && lblFromAcc.text != "" ){
            boo = true
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
