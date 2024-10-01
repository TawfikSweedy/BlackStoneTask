//
//  ForeCastModel.swift
//  SwensonCodingChallenge
//
//  Created by Tawfik Sweedy✌️ .
//

import Foundation

struct ForeCastModel : Codable {
    let location : Location?
    let current : Current?
    let forecast : Forecast?

    enum CodingKeys: String, CodingKey {

        case location = "location"
        case current = "current"
        case forecast = "forecast"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        current = try values.decodeIfPresent(Current.self, forKey: .current)
        forecast = try values.decodeIfPresent(Forecast.self, forKey: .forecast)
    }

}
struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch : Int?
    let localtime : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tz_id = "tz_id"
        case localtime_epoch = "localtime_epoch"
        case localtime = "localtime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tz_id = try values.decodeIfPresent(String.self, forKey: .tz_id)
        localtime_epoch = try values.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }

}
struct Current : Codable {
    let last_updated_epoch : Int?
    let last_updated : String?
    let temp_c : Double?
    let temp_f : Double?
    let is_day : Int?
    let condition : Condition?
    let wind_mph : Double?
    let wind_kph : Double?
    let wind_degree : Int?
    let wind_dir : String?
    let pressure_mb : Double?
    let pressure_in : Double?
    let precip_mm : Double?
    let precip_in : Double?
    let humidity : Int?
    let cloud : Int?
    let feelslike_c : Double?
    let feelslike_f : Double?
    let vis_km : Double?
    let vis_miles : Double?
    let uv : Double?
    let gust_mph : Double?
    let gust_kph : Double?
//    let air_quality : Air_quality?

    enum CodingKeys: String, CodingKey {

        case last_updated_epoch = "last_updated_epoch"
        case last_updated = "last_updated"
        case temp_c = "temp_c"
        case temp_f = "temp_f"
        case is_day = "is_day"
        case condition = "condition"
        case wind_mph = "wind_mph"
        case wind_kph = "wind_kph"
        case wind_degree = "wind_degree"
        case wind_dir = "wind_dir"
        case pressure_mb = "pressure_mb"
        case pressure_in = "pressure_in"
        case precip_mm = "precip_mm"
        case precip_in = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslike_c = "feelslike_c"
        case feelslike_f = "feelslike_f"
        case vis_km = "vis_km"
        case vis_miles = "vis_miles"
        case uv = "uv"
        case gust_mph = "gust_mph"
        case gust_kph = "gust_kph"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        last_updated_epoch = try values.decodeIfPresent(Int.self, forKey: .last_updated_epoch)
        last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated)
        temp_c = try values.decodeIfPresent(Double.self, forKey: .temp_c)
        temp_f = try values.decodeIfPresent(Double.self, forKey: .temp_f)
        is_day = try values.decodeIfPresent(Int.self, forKey: .is_day)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        wind_mph = try values.decodeIfPresent(Double.self, forKey: .wind_mph)
        wind_kph = try values.decodeIfPresent(Double.self, forKey: .wind_kph)
        wind_degree = try values.decodeIfPresent(Int.self, forKey: .wind_degree)
        wind_dir = try values.decodeIfPresent(String.self, forKey: .wind_dir)
        pressure_mb = try values.decodeIfPresent(Double.self, forKey: .pressure_mb)
        pressure_in = try values.decodeIfPresent(Double.self, forKey: .pressure_in)
        precip_mm = try values.decodeIfPresent(Double.self, forKey: .precip_mm)
        precip_in = try values.decodeIfPresent(Double.self, forKey: .precip_in)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        feelslike_c = try values.decodeIfPresent(Double.self, forKey: .feelslike_c)
        feelslike_f = try values.decodeIfPresent(Double.self, forKey: .feelslike_f)
        vis_km = try values.decodeIfPresent(Double.self, forKey: .vis_km)
        vis_miles = try values.decodeIfPresent(Double.self, forKey: .vis_miles)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
        gust_mph = try values.decodeIfPresent(Double.self, forKey: .gust_mph)
        gust_kph = try values.decodeIfPresent(Double.self, forKey: .gust_kph)
//        air_quality = try values.decodeIfPresent(Air_quality.self, forKey: .air_quality)
    }

}
struct Condition : Codable {
    let text : String?
    let icon : String?
    let code : Int?

    enum CodingKeys: String, CodingKey {

        case text = "text"
        case icon = "icon"
        case code = "code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }

}
struct Air_quality : Codable {
    let no2 : Double?
    let o3 : Double?
    let so2 : Double?
    let pm2_5 : Double?
    let pm10 : Double?


    enum CodingKeys: String, CodingKey {
        case no2 = "no2"
        case o3 = "o3"
        case so2 = "so2"
        case pm2_5 = "pm2_5"
        case pm10 = "pm10"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        no2 = try values.decodeIfPresent(Double.self, forKey: .no2)
        o3 = try values.decodeIfPresent(Double.self, forKey: .o3)
        so2 = try values.decodeIfPresent(Double.self, forKey: .so2)
        pm2_5 = try values.decodeIfPresent(Double.self, forKey: .pm2_5)
        pm10 = try values.decodeIfPresent(Double.self, forKey: .pm10)
    }

}
struct Forecast : Codable {
    let forecastday : [Forecastday]?

    enum CodingKeys: String, CodingKey {

        case forecastday = "forecastday"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        forecastday = try values.decodeIfPresent([Forecastday].self, forKey: .forecastday)
    }

}
struct Forecastday : Codable {
    let date : String?
    let date_epoch : Int?
    let day : Day?
    let astro : Astro?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case date_epoch = "date_epoch"
        case day = "day"
        case astro = "astro"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        date_epoch = try values.decodeIfPresent(Int.self, forKey: .date_epoch)
        day = try values.decodeIfPresent(Day.self, forKey: .day)
        astro = try values.decodeIfPresent(Astro.self, forKey: .astro)
    }

}
struct Day : Codable {
    let maxtemp_c : Double?
    let maxtemp_f : Double?
    let mintemp_c : Double?
    let mintemp_f : Double?
    let avgtemp_c : Double?
    let avgtemp_f : Double?
    let maxwind_mph : Double?
    let maxwind_kph : Double?
    let totalprecip_mm : Double?
    let totalprecip_in : Double?
    let avgvis_km : Double?
    let avgvis_miles : Double?
    let avghumidity : Double?
    let daily_will_it_rain : Int?
    let daily_chance_of_rain : Int?
    let daily_will_it_snow : Int?
    let daily_chance_of_snow : Int?
    let condition : Condition?
    let uv : Double?
    let air_quality : Air_quality?

    enum CodingKeys: String, CodingKey {

        case maxtemp_c = "maxtemp_c"
        case maxtemp_f = "maxtemp_f"
        case mintemp_c = "mintemp_c"
        case mintemp_f = "mintemp_f"
        case avgtemp_c = "avgtemp_c"
        case avgtemp_f = "avgtemp_f"
        case maxwind_mph = "maxwind_mph"
        case maxwind_kph = "maxwind_kph"
        case totalprecip_mm = "totalprecip_mm"
        case totalprecip_in = "totalprecip_in"
        case avgvis_km = "avgvis_km"
        case avgvis_miles = "avgvis_miles"
        case avghumidity = "avghumidity"
        case daily_will_it_rain = "daily_will_it_rain"
        case daily_chance_of_rain = "daily_chance_of_rain"
        case daily_will_it_snow = "daily_will_it_snow"
        case daily_chance_of_snow = "daily_chance_of_snow"
        case condition = "condition"
        case uv = "uv"
        case air_quality = "air_quality"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        maxtemp_c = try values.decodeIfPresent(Double.self, forKey: .maxtemp_c)
        maxtemp_f = try values.decodeIfPresent(Double.self, forKey: .maxtemp_f)
        mintemp_c = try values.decodeIfPresent(Double.self, forKey: .mintemp_c)
        mintemp_f = try values.decodeIfPresent(Double.self, forKey: .mintemp_f)
        avgtemp_c = try values.decodeIfPresent(Double.self, forKey: .avgtemp_c)
        avgtemp_f = try values.decodeIfPresent(Double.self, forKey: .avgtemp_f)
        maxwind_mph = try values.decodeIfPresent(Double.self, forKey: .maxwind_mph)
        maxwind_kph = try values.decodeIfPresent(Double.self, forKey: .maxwind_kph)
        totalprecip_mm = try values.decodeIfPresent(Double.self, forKey: .totalprecip_mm)
        totalprecip_in = try values.decodeIfPresent(Double.self, forKey: .totalprecip_in)
        avgvis_km = try values.decodeIfPresent(Double.self, forKey: .avgvis_km)
        avgvis_miles = try values.decodeIfPresent(Double.self, forKey: .avgvis_miles)
        avghumidity = try values.decodeIfPresent(Double.self, forKey: .avghumidity)
        daily_will_it_rain = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_rain)
        daily_chance_of_rain = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_rain)
        daily_will_it_snow = try values.decodeIfPresent(Int.self, forKey: .daily_will_it_snow)
        daily_chance_of_snow = try values.decodeIfPresent(Int.self, forKey: .daily_chance_of_snow)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        uv = try values.decodeIfPresent(Double.self, forKey: .uv)
        air_quality = try values.decodeIfPresent(Air_quality.self, forKey: .air_quality)
    }

}
struct Astro : Codable {
    let sunrise : String?
    let sunset : String?
    let moonrise : String?
    let moonset : String?
    let moon_phase : String?
    let moon_illumination : Double?

    enum CodingKeys: String, CodingKey {

        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moon_phase = "moon_phase"
        case moon_illumination = "moon_illumination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
        moonrise = try values.decodeIfPresent(String.self, forKey: .moonrise)
        moonset = try values.decodeIfPresent(String.self, forKey: .moonset)
        moon_phase = try values.decodeIfPresent(String.self, forKey: .moon_phase)
        moon_illumination = try values.decodeIfPresent(Double.self, forKey: .moon_illumination)
    }

}
