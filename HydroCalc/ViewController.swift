//
//  ViewController.swift
//  HydroCalc
//
//  Created by Tomas Peranic on 2019-09-24.
//  Copyright © 2019 Tomas Peranic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var onPeak: UITextField!
    @IBOutlet weak var midPeak: UITextField!
    @IBOutlet weak var offPeak: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction private func doCalculateBill(){
        let email = emailAddress.text!
        let phone = phoneNumber.text!
        let peak = onPeak.text!
        let mid = midPeak.text!
        let off = offPeak.text!
        
        if (email=="" && phone=="" && peak=="" && mid=="" && off==""){
            showAlert(msg:"Please fill in all the required fields!")

        }
        else{
            openDisplayBill()
        }
         
        
       }
    
        func openDisplayBill(){
            let sbMain : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let displayHydroBill = sbMain.instantiateViewController(withIdentifier: "DisplayBill") as! ViewController
            navigationController?.pushViewController(displayHydroBill, animated: true)
            //displayHydroBill.billAmount = self.billAmount
    //        self.present(receiptVC, animated: true, completion: nil)

        }
    
    func showAlert(msg: String){
        let alertMessage = UIAlertController(title: "WARNING", message: msg, preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alertMessage, animated: true, completion: nil)
        
    }
    
}

