//
//  BillVC.swift
//  HydroCalc
//
//  Created by Tomas Peranic on 2019-10-01.
//  Copyright © 2019 Tomas Peranic. All rights reserved.
//

import UIKit
class BillVC: UIViewController {
    var finalPeak: Double! = 0.0
    var finalMid: Double! = 0.0
    var finalOff: Double! = 0.0

    var regulatoryCharges: Double = 0.0
    var totalCharges: Double = 0.0
    var HST: Double = 0.0
    var totalAmount = 0.0
    var provincial = 0.0

    @IBOutlet var peakLabel: UILabel!
    @IBOutlet var midPeakLabel: UILabel!
    @IBOutlet var offPeakLabel: UILabel!
    @IBOutlet var regulatoryLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var hstLabel: UILabel!
    @IBOutlet var provincialLabel: UILabel!
    @IBOutlet var amountDueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        peakLabel.text = "$ " + String(format: "%.2f", finalPeak)
        midPeakLabel.text = "$ " + String(format: "%.2f", finalMid)
        offPeakLabel.text = "$ " + String(format: "%.2f", finalOff)

        regulatoryLabel.text = "$ " + String(format: "%.2f", regulatoryCharges)
        totalLabel.text = "$ " + String(format: "%.2f", totalCharges)
        hstLabel.text = "$ " + String(format: "%.2f", HST)
        provincialLabel.text = "$ " + String(format: "%.2f", provincial)
        amountDueLabel.text = "$ " + String(format: "%.2f", totalAmount)
    }
}
