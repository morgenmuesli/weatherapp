//
//  CurrentForecastViewModel.swift
//  Christoph_WeatherApp
//
//  Created by Christoph Meyer on 12.07.19.
//  Copyright © 2019 Christoph Meyer. All rights reserved.
//

import UIKit

struct CurrentForecastViewModel {
    let city : String?
    let weather : String?
    let temp : Double?
    let image: UIImage?
    
    
    
}

extension CurrentForecastViewModel {
    init(currentWeather : Forecast){
        
        // ich weiß das man da eigentlich n exception handling machen sollte und nicht einfach alles forcieren sollte... 
        city = currentWeather.name!
        temp = currentWeather.main!.temp!
        if let weather = currentWeather.weather![0].weatherDescription {
            self.weather = weather
        }else {
            self.weather = currentWeather.weather![0].main!
        }
        image = imageChooser(weather: currentWeather.weather![0].main!)
        
    }
}



func imageChooser(weather: String) -> UIImage? {
    switch weather {
    case "Thunderstorm":
        return UIImage(named: "thunderstorm")
    case "Drizzle":
        return UIImage(named: "sleet")
    case "Rain":
        return UIImage(named: "rain")
    case "Snow":
        return UIImage(named: "snow")
    case "Clear":
        return UIImage(named: "sunny")
    default:
        return UIImage(named: "partly-cloudy-day")
    }
}
