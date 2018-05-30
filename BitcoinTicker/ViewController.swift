//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Anthony Ruiz on 5/29/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit
import RevealingSplashView
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
   let currencySimbol = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
   
   var simbolSelected = ""
   
    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
   
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
   }
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return currencyArray.count
   }
   
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return currencyArray[row]
   }
   
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      //      print(currencyArray[row])
      //      print(baseURL+currencyArray[row])
      finalURL = baseURL + currencyArray[row]
      getBitCoinData(url: finalURL)
      simbolSelected = currencySimbol[row]
   }
   
   //splash screen
   let revealingSplashScreen = RevealingSplashView(iconImage: UIImage(named:"apple")!, iconInitialSize: CGSize(width:80, height:80), backgroundColor: UIColor.lightGray)

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.view.addSubview(self.revealingSplashScreen)
      self.revealingSplashScreen.animationType = SplashAnimationType.popAndZoomOut
      self.revealingSplashScreen.startAnimation()
      
      currencyPicker.delegate = self
      currencyPicker.dataSource = self

       
    }
    //MARK: - Networking
    /***************************************************************/
   
    func getBitCoinData(url: String) {
      
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got BitCoin Data")
                    let bitJSON : JSON = JSON(response.result.value!)
                     //print(bitJSON)

                    self.updateBitCoinData(json: bitJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }
  
    //MARK: - JSON Parsing
    /***************************************************************/
   
    func updateBitCoinData(json : JSON) {
      
        if let bitCoinPrice = json["ask"].double {
         bitcoinPriceLabel.text = "\(simbolSelected) \(bitCoinPrice)"
        }else{
         bitcoinPriceLabel.text = "Price Unavailable"
      }
    }
}

