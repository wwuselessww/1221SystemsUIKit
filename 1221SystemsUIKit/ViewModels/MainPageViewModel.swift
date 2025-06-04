//
//  MainPageViewModel.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//
import Combine
import Foundation

class MainPageViewModel: ObservableObject {
    var cityName: String = ""
    @Published var weatherObject: Weather?
    var conditionString: String = ""
    var temreratureString: String = ""
    var windSpeedString: String = ""
    var humidityString: String = ""
    
    var cancellables: Set<AnyCancellable> = []
    
    func getWeather() {
        Task {
            do {
                weatherObject = try await NetworkManager.shared.fetchWeather(for: "Saint-Petersburg")
                
            } catch {
                print(error)
            }
        }
    }
    
    func populateWeatherText() async {
        cityName = weatherObject?.location?.name ?? "NO"
        conditionString = weatherObject?.current?.condition?.text ?? "kek"
        temreratureString = String(format: "%.0f",weatherObject?.forecast?.forecastday[0].day?.avgtempC ?? 0)
        windSpeedString = String(format: "%.0f",weatherObject?.forecast?.forecastday[0].day?.maxwindKph ?? "no")
        humidityString = String(format: "%.0f",weatherObject?.forecast?.forecastday[0].day?.avghumidity ?? "no")
        print(cityName)
    }
}
