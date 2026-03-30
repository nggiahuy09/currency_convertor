//
//  SecretsDecoder.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 30/3/26.
//

import Foundation

enum Secrets {
    static var appId: String {
        guard let appId = Bundle.main.infoDictionary?["CURRENCY_EXCHANGE_APP_ID"] as? String else {
            fatalError("Currency Exchange App Id not found")
        }

        return appId
    }
}
