//
//  WeatherViewModel.swift
//  WeatherAPI
//
//  Created by Martyna Mieczkowska on 29/08/2024.
//

import Foundation

@MainActor

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = " "
    @Published var temperature: String = " "
    @Published var description: String = " "
    
    private let weatherService = WeatherService()
    
    func fetchWeather() async {
        do {
            let weather = try await weatherService.fechWeather(for: cityName);updateUI(with: weather)
        } catch {
            print("Failed to fetch weather: \(error)")
        }
    }
    
    private func updateUI(with weather: WeatherModel) {
        temperature = String(format: "%.1f", weather.main.temp ?? 0.0 ) + "°C"
        description = weather.weather.first?.description ?? "No description"
        }
    }

