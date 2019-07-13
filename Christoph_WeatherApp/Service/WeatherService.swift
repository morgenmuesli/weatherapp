//
//  WeatherService.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 10.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import Foundation
import Moya

enum WeatherService {
    static private let apikey = "bb5c4f9377dd989db6590f301e7d2c3a"
    case current(lat: Double, long: Double)
    
}


extension WeatherService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .current:
            return "/weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .current: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .current(lat, long):
            
            return .requestParameters(parameters: ["lat" : lat, "lon": long,"units":"metric", "APPID": WeatherService.apikey], encoding: URLEncoding.default)
            
        
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    
}

