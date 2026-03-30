//
//  Rates.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 30/3/26.
//

import Foundation

struct Rates: Decodable {
    let rates: [String: Double]
}
