//
//  Weather.swift
//  1221SystemsUIKit
//
//  Created by Alexander Kozharin on 03.06.25.
//

import Foundation

struct WeatherModel: Hashable {
    var id = UUID()
    var name: String
}

// MARK: - Weather
struct Weather: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable, Hashable {
    let id = UUID()
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC, tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Int?
    let windDir: String?
    let pressureMB: Int?
    let pressureIn, precipMm, precipIn: Double?
    let humidity, cloud: Int?
    let feelslikeC, feelslikeF, windchillC, windchillF: Double?
    let heatindexC, heatindexF, dewpointC, dewpointF: Double?
    let visKM, visMiles: Int?
    let uv, gustMph, gustKph: Double?
    let timeEpoch: Int?
    let time: String?
    let snowCM, willItRain, chanceOfRain, willItSnow: Int?
    let chanceOfSnow: Int?

}

// MARK: - Condition
struct Condition: Codable, Hashable {
    let text: String?
    let icon: String?
    let code: Int?
}


// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]
}

// MARK: - Forecastday
struct Forecastday: Codable, Hashable {
    let id = UUID()
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Current]
}

// MARK: - Astro
struct Astro: Codable, Hashable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase: String?
    let moonIllumination, isMoonUp, isSunUp: Int?
}

// MARK: - Day
struct Day: Codable, Hashable {
    static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.id == rhs.id
    }
    let id = UUID()
    let maxtempC, maxtempF, mintempC, mintempF: Double?
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    let totalprecipMm, totalprecipIn: Double?
    let totalsnowCM, avgvisKM, avgvisMiles, avghumidity: Int?
    let dailyWillItRain, dailyChanceOfRain, dailyWillItSnow, dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Double?
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
//    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?
}

