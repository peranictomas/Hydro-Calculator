//
//  InputVC.swift
//  HydroCalc
//
//  Created by Tomas Peranic on 2019-10-01.
//  Copyright © 2019 Tomas Peranic. All rights reserved.
//

import UIKit

class InputVC: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet var emailAddress: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var onPeak: UITextField!
    @IBOutlet var midPeak: UITextField!
    @IBOutlet var offPeak: UITextField!

    var peak: Double! = 0.0
    var midP: Double! = 0.0
    var offP: Double! = 0.0
    var finalpeak: Double! = 0.0
    var finalmidP: Double! = 0.0
    var finaloffP: Double! = 0.0
    var regulatoryCharges = 3.28
    var totalCharges = 0.0
    var HST = 0.0
    var totalAmount = 0.0
    var provincialRebate = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        // pushes done button to right
        let flexableSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        toolBar.setItems([flexableSpace, doneButton], animated: false)

        emailAddress.inputAccessoryView = toolBar
        phoneNumber.inputAccessoryView = toolBar
        onPeak.inputAccessoryView = toolBar
        midPeak.inputAccessoryView = toolBar
        offPeak.inputAccessoryView = toolBar
    }

    @objc func doneClicked() {
        view.endEditing(true)
    }

    @IBAction private func doCalculateBill() {
        var email: String! = ""
        var phone: String! = ""
        var on: String! = ""
        var mid: String! = ""
        var off: String! = ""

        email = emailAddress.text!
        phone = phoneNumber.text!
        on = onPeak.text!
        mid = midPeak.text!
        off = offPeak.text!


        if (email != "" && phone != "" && on != "" && mid != "" && off != "") {
            peak = Double(on)
                midP = Double(mid)
                offP = Double(off)
                finalpeak = 0.132 * peak
                finalmidP = 0.094 * midP
                finaloffP = 0.065 * offP
                totalCharges = finalpeak + finalmidP + finaloffP + regulatoryCharges
                HST = (totalCharges + regulatoryCharges) * 0.13
                totalAmount = (totalCharges + HST) - (totalCharges * 0.08)
                provincialRebate = totalCharges * 0.08
                performSegue(withIdentifier: "data", sender: self)
        } else {

    showAlert(msg: "Please fill in all the required fields!")

        }
    }

    func showAlert(msg: String) {
        let alertMessage = UIAlertController(title: "WARNING", message: msg, preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertMessage, animated: true, completion: nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BillVC
        vc.finalPeak = finalpeak
        vc.finalMid = finalmidP
        vc.finalOff = finaloffP
        vc.regulatoryCharges = regulatoryCharges
        vc.totalCharges = totalCharges
        vc.totalAmount = totalAmount
        vc.HST = HST
        vc.provincial = provincialRebate
    }
}
