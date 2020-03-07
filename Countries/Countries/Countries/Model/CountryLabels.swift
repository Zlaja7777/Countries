//
//  CountryLabels.swift
//  Countries
//
//  Created by Zlatan Haljeta on 05/03/2020.
//  Copyright © 2020 Zlatan Haljeta. All rights reserved.
//

import Foundation


struct CountryLabels {
    
    var capital: String;
    var region: String;
    var population: Int;
    var nativeName: String;
    var urlFlag: String;
    var language: String;
    
    
    init(capital: String, region: String, population: Int, nativeName: String, urlFlag: String, language: String)
    {
        self.capital = capital;
        self.region = region;
        self.population = population;
        self.nativeName = nativeName;
        self.urlFlag = urlFlag;
        self.language = language;
    }
}
