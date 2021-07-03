//
//  Weather.swift
//  WeatherAppTest
//
//  Created by Gleb Ilchyshyn on 03.07.2021.
//

import Foundation


// MARK: - Weather
struct Weather: Codable {
    let lat, lon: Double?
    let timezone: String?
    let timezoneOffset: Int?
    let current: Current?
    let hourly: [Current]?
    let daily: [Daily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Int?
    let temp: Double?
    let humidity: Int?
    let windSpeed: Double?
    let windDeg: Int?
    let weather: [WeatherElement]?
    

    enum CodingKeys: String, CodingKey {
        case dt,temp
        case humidity
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main: Main?
    let weatherDescription: Description?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int?
    let temp: Double?
    let weather: [WeatherElement]?

    enum CodingKeys: String, CodingKey {
        case dt, temp
        case weather
    }
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int?
    let temp: Temp?
    let weather: [WeatherElement]?

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max: Double?
}

