//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    // =========== IBOutlet定義 ===========
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // =========== IBAction定義 ===========
    // チップを変更する関数。チップの値を少数に変換する(例:10% → 0.1)
    @IBAction func tipChanged(_ sender: UIButton) {
        // キーボードを閉じる
        billTextField.endEditing(true)
        
        // persentButtonをクリア
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //　ユーザが指定したボタンを活性化
        sender.isSelected = true
        
        // ユーザが指定したボタンのタイトルを取得
        let buttonTitle = sender.currentTitle!
        
        // ボタンタイトルの末尾の文字(%)を削除
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        // パーセント表示を変換 (例)10 → 0.1
        tip = buttonTitleAsANumber / 100
    }
    
    // ステッパー値を変更する関数。
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    // 計算ボタン押下時の関数。
    // 請求額に対し、チップのパーセンテージを加算する。そして演算結果より人数分を除算する。
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        // billTextFieldに値が入力された場合
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            // 少数第2位まで表示
            finalResult = String(format: "%.2f", result)
        }
        // 画面遷移する
        performSegue(withIdentifier: "calculateResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    

}

