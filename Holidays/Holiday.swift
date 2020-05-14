//
//  Holiday.swift
//  Holidays
//
//  Created by Андрей Сигида on 06/05/2020.
//  Copyright © 2020 Андрей Сигида. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var response:Holidays
}

struct Holidays:Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail:Decodable {
    var name:String
    var date: DateInfo
}

struct DateInfo:Decodable {
    var iso:String
}
