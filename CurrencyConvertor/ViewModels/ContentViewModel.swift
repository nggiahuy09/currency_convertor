//
//  ContentViewModel.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 29/3/26.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {

    init(baseAmount: Double = 0.0, baseCurrency: CurrencyChoice = .Usa, convertedAmount: Double = 0.0, convertedCurrency: CurrencyChoice = .Vietnam) {
        self.baseAmount = baseAmount
        self.baseCurrency = baseCurrency
        self.convertedAmount = convertedAmount
        self.convertedCurrency = convertedCurrency
    }

    @Published var baseAmount: Double
    @Published var baseCurrency: CurrencyChoice
    @Published var convertedAmount: Double
    @Published var convertedCurrency: CurrencyChoice


    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter
    }
}
