//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 安達篤史 on 2020/07/05.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // =========== IBOutlet定義 ===========
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面項目を更新
        totalLabel.text = result
        settingsLabel.text = "Split Between \(split), with \(tip)% tip."

    }
    
    // =========== IBAction定義　===========
    // 遷移元の画面に遷移
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
