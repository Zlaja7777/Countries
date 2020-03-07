//
//  Countries.swift
//  Countries
//
//  Created by Zlatan Haljeta on 27/02/2020.
//  Copyright © 2020 Zlatan Haljeta. All rights reserved.
//

import Foundation
protocol CountriesDelegate {
    func didUpdateCountry (countries: Countries, country: CountryLabels)
    
    func error(error: Error)
}
struct Countries{
    
    let countriesURL = "https://restcountries.eu/rest/v2/name/";
    var delegate: CountriesDelegate?;
    func fetchCountry(countryName: String) {
        let urlRest = countriesURL + countryName;
        
        
        performRequest(url: urlRest)
    }
    
    func performRequest(url: String){
        if let url = URL(string: url) {
        
            let session = URLSession(configuration: .default);
            let task = session.dataTask(with: url, completionHandler: handle(data:urlResponse:error:))
            
            
            task.resume();//they begin in suspended task
        }
         
        
    }
    
    func handle(data: Data?, urlResponse: URLResponse?, error: Error?) -> Void {
        if error != nil {
            print(error);
            delegate?.error(error: error!);
            return;
        }
        if let safeData = data{
            if let dataCountry = self.parseJSON(countryData: safeData){

                delegate?.didUpdateCountry(countries: self, country: dataCountry);

            }
        }
    }
    func parseJSON (countryData: Data)-> CountryLabels?{
        let decoder = JSONDecoder();
//        let jsonString = String(data: countryData, encoding: .utf8)
        do{
            let decodedData =
                try decoder.decode([CountryData].self, from: countryData);
            
            print(decodedData[0].flag);
            
//              print(decodedData[0].language[0].name);
//            print(decodedData[0].region);
//            print(decodedData[0].population);
//            print(decodedData[0].nativeName);
            
            var cd = CountryLabels(capital: decodedData[0].capital,
                                   region: decodedData[0].region,
                                   population: decodedData[0].population,
                                   nativeName: decodedData[0].nativeName,
                                   urlFlag: decodedData[0].flag,
                                   language: decodedData[0].languages[0].name
                               )
            return cd;
           
        } catch{
            delegate?.error(error: error);
            return nil;
        }
  
    }
    
    
}

