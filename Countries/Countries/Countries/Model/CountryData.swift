//
//  CountryData.swift
//  Countries
//
//  Created by Zlatan Haljeta on 03/03/2020.
//  Copyright © 2020 Zlatan Haljeta. All rights reserved.
//

import Foundation

struct CountryData: Decodable{
    
    let capital: String;
    let region: String;
    
    let population: Int;
    
    let languages: [Language];
    let nativeName: String;
    
    let flag: String;
}

struct Language: Decodable{
    let name : String;
}
