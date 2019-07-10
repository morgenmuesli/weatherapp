//
//  WeatherInfo.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 10.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import Foundation

struct WeatherInfo: Codable{
    var coord : Coord
    var weather : [Weather]
    var base : String
    var main : Main
    var visibility : Int
    var wind : Wind
    var clouds : Clouds
    var dt : Int
    var sys : Sys
    var id : Int
    var name : String
    var cod : Int
    
    
}

struct Coord : Codable{
    var lon : Double
    var lat : Double
    
}

struct Weather : Codable{
    var id : Int
    var main : String
    var description : String
    var icon : String
}

struct Main : Codable{
    var temp : Double
    var pressure : Int
    var humidity : Int
    var temp_min : Double
    var temp_max : Double
}

struct Clouds : Codable {
    var all : Int
}

struct Wind : Codable {
    var speed : Double
    var deg : Int
}

struct Sys : Codable {
    var type : Int
    var id : Int
    var message : Double
    var country : String
    var sunrise : Int
    var sunset : Int
    
}
