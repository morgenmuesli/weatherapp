// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecast = try? newJSONDecoder().decode(Forecast.self, from: jsonData)

import Foundation

// MARK: - Forecast
struct Forecast : Decodable{
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?
    let timezone, id: Int?
    let name: String?
    let cod: Int?
}

// MARK: - Clouds
struct Clouds : Decodable{
    let all: Int?
}

// MARK: - Coord
struct Coord : Decodable{
    let lon, lat: Double?
}

// MARK: - Main
struct Main : Decodable{
    let temp: Double?
    let pressure, humidity: Int?
    let tempMin, tempMax: Double?
}

// MARK: - Sys
struct Sys : Decodable{
    let type, id: Int?
    let message: Double?
    let country: String?
    let sunrise, sunset: Int?
}

// MARK: - Weather
struct Weather : Decodable{
    let id: Int?
    let main, weatherDescription, icon: String?
}

// MARK: - Wind
struct Wind : Decodable{
    let speed: Double?
    let deg: Double?
}
