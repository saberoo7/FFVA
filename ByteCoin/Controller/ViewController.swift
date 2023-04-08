//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
         coinManager.delegate = self //to allow the view controller to receive updates from the CoinManager
         currencyPicker.dataSource = self //get the currently selected currency and update the view when the user selects a new currency in the picker.
        currencyPicker.delegate = self
    }
}

//MARK: -   CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: -     UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
   
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1  //select a single item from a list of currencies
      }
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinManager.currencyArray.count // returns the number of elements in the currencyArray property of the CoinManager object
      }
         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return coinManager.currencyArray[row]   // returns a string that corresponds to the currency symbol for the row specified by the row parameter.
      }
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          let selectedCurrency = coinManager.currencyArray[row]
          coinManager.getCoinPrice(for: selectedCurrency)
    // -> passes this currency value to getCoinPrice responsible for retrieving the latest Bitcoin exchange rate for the selected currency.
      }
}

