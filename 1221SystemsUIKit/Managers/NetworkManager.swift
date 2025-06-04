//
//  NetworkManager.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 04.06.25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {
        
    }
    
    enum NetworkError: Error {
           case invalidURL
           case badResponse(statusCode: Int)
           case noData
       }
    
    func fetchWeather(for city: String) async throws -> Weather? {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") else {
            print("no api key in infoPlist")
            return nil
        }
        print("https://api.weatherapi.com/v1/forecast.json?q=\(city)&days=5&key=\(Bundle.main.object(forInfoDictionaryKey: "ApiKey"))")
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?q=\(city)&days=5&key=\(apiKey)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse(statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(Weather.self, from: data)
        return result
    }
    
}
