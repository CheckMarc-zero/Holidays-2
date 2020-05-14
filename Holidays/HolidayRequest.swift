//
//  HolidayRequest.swift
//  Holidays
//
//  Created by Андрей Сигида on 07/05/2020.
//  Copyright © 2020 Андрей Сигида. All rights reserved.
//

import Foundation

enum HolidayError: Error{
    case noDataAvilable
    case canNotProcessData
}

struct HolideyRequest {
    let resourseURL : URL
    let API_KEY = "5198145229ff7ed687593c0a85d05245598033d9"
    
    init(countryCode:String) {
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let currentYear = format.string(from: date)
        
        let resourseString =  "https://calendarific.com/api/v2/holidays?api_key=\(API_KEY)&country=\(countryCode)&year=\(currentYear)"
        
        guard let resourseURL = URL(string: resourseString) else  {fatalError()}
        self.resourseURL = resourseURL
    }
    
    func getHolidays(completion: @escaping(Result<[HolidayDetail],HolidayError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourseURL) {data, _,_ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvilable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let holidaysResponse = try decoder.decode(HolidayResponse.self, from: jsonData)
                let holidayDetails = holidaysResponse.response.holidays
                completion(.success(holidayDetails))
                
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
    
        dataTask.resume()
}
}
