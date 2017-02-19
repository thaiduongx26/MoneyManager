//
//  BaseView.swift
//  MoneyManager
//
//  Created by ThaiDuong on 2/16/17.
//  Copyright © 2017 ThaiDuong. All rights reserved.
//

import UIKit

class BaseView: UIView {

    var name : String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.addGestureRecognizer(gesture)
        
    }
    func someAction(_ sender: UIGestureRecognizer){
        print(self.name)
        if self.name == "CalVC" {
            let secondViewController = self.parentViewController?.storyboard?.instantiateViewController(withIdentifier: "CalVC") as! CalculatorViewController
            secondViewController.delegate = self.parentViewController as! recordsViewController?
            //self.parentViewController?.navigationController?.pushViewController(secondViewController, animated: true)
            self.parentViewController?.navigationController?.pushViewController(secondViewController, animated: true)
        } else if self.name == "SpentVC" {
            let secondViewController = self.parentViewController?.storyboard?.instantiateViewController(withIdentifier: self.name) as! SpentViewController
            secondViewController.delegate = self.parentViewController as! recordsViewController?
            self.parentViewController?.navigationController?.pushViewController(secondViewController, animated: true)
        } else if self.name == "StatusVC"{
            let secondViewController = self.parentViewController?.storyboard?.instantiateViewController(withIdentifier: self.name) as! StatusViewController
            secondViewController.delegate = self.parentViewController as! recordsViewController?
            self.parentViewController?.navigationController?.pushViewController(secondViewController, animated: true)
        } else if self.name == "ChoseAccVC" {
            let secondViewController = self.parentViewController?.storyboard?.instantiateViewController(withIdentifier: self.name) as! ChoseAccountViewController
            secondViewController.delegate = self.parentViewController as! recordsViewController?
            self.parentViewController?.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.addGestureRecognizer(gesture)
    }


}
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
