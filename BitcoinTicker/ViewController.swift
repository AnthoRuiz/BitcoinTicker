//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Anthony Ruiz on 5/29/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return currencyArray.count
   }
   
   
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
   }
   
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return currencyArray[row]
   }
   
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//      print(currencyArray[row])
//      print(baseURL+currencyArray[row])
      finalURL = baseURL + currencyArray[row]
   }
   
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
   
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

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
//    func getWeatherData(url: String, parameters: [String : String]) {
//        
//        Alamofire.request(url, method: .get, parameters: parameters)
//            .responseJSON { response in
//                if response.result.isSuccess {
//
//                    print("Sucess! Got the weather data")
//                    let weatherJSON : JSON = JSON(response.result.value!)
//
//                    self.updateWeatherData(json: weatherJSON)
//
//                } else {
//                    print("Error: \(String(describing: response.result.error))")
//                    self.bitcoinPriceLabel.text = "Connection Issues"
//                }
//            }
//
//    }
//
//    
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//        
//        if let tempResult = json["main"]["temp"].double {
//        
//        weatherData.temperature = Int(round(tempResult!) - 273.15)
//        weatherData.city = json["name"].stringValue
//        weatherData.condition = json["weather"][0]["id"].intValue
//        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
//        }
//        
//        updateUIWithWeatherData()
//    }
//    




}

