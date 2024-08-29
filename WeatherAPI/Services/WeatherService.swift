//
//  WeatherService.swift
//  WeatherAPI
//
//  Created by Martyna Mieczkowska on 29/08/2024.
//

import Foundation

class WeatherService {
    private let apiKey = "7b95448eb9a4fa5e826c3ed61c04cb14"
    
    func fechWeather(for city: String) async throws -> WeatherModel {
        let cityEscaped = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
        return weather
        
    }
}
