//
//  WeatherModel.swift
//  WeatherAPI
//
//  Created by Martyna Mieczkowska on 29/08/2024.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double?
        let humidity: Double?
    }
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}

