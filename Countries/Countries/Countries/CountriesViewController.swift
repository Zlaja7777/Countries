//
//  ViewController.swift
//  Countries
//
//  Created by Zlatan Haljeta on 07/02/2020.
//  Copyright © 2020 Zlatan Haljeta. All rights reserved.
//

import UIKit
class CountriesViewController: UIViewController, UITextFieldDelegate, CountriesDelegate {

    
    

    var c = Countries();
    
    

    
    @IBOutlet var inputText: UITextField!
    
    @IBOutlet var capitalCity: UILabel!
    @IBOutlet var region: UILabel!
    @IBOutlet var population: UILabel!
    @IBOutlet var nativeName: UILabel!
    @IBOutlet var countryFlag: UIImageView!
    @IBOutlet var language: UILabel!
    @IBAction func gotPressed(_ sender: Any) {
        
        
        inputText.endEditing(true);
        //dissmises the keyboard after pressing the button
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        c.delegate = self;
        inputText.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SearchButton(_ sender: UIButton) {
        inputText.endEditing(true); //dissmises the keyboard after pressing the button
        print(inputText.text!);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         inputText.endEditing(true); //dissmises the keyboard after pressing GO
         print(inputText.text!);
         return true;
         //this method saves the input text after the user pressess the
         //Go button on keyboard
     }
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
         if textField.text != ""{
             return true;
         }
         else{
             textField.placeholder = "Type something..."
             return false;
         }
         //prevents the user to search without typing a country
     }
    
     func textFieldDidEndEditing(_ textField: UITextField) {
         
         if let city = inputText.text{
            c.fetchCountry(countryName: city);
            
         }
         inputText.text = "";
         //after the user pressess GO or UIButton, text field will display his placeholder //
        
     
     }

    
    func didUpdateCountry( countries: Countries, country: CountryLabels){
        
        
        DispatchQueue.main.async {
            self.capitalCity.text = country.capital;
            self.region.text = country.region;
            self.population.text = String((country.population));
            self.nativeName.text = country.nativeName;
            self.language.text = country.language;
        }
        ////Explanation
//DispatchQueue.main.async -> we use that when we are updating the
//UI (in this case capitalCity.text). Completion handler has to finish the dataTask (which is a long running task), and the the user could wait minutes for the capitalCity.text to update. But, when using the DispatchQueue.main.async, which is going back to the main thread to continue the update...
        
    }
    func error(error: Error) {
        print(error);
    }
    
}

