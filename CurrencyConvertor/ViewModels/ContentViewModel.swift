//
//  ContentViewModel.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 29/3/26.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {

    init(convertedAmount: Double = 0.0, baseAmount: Double = 0.0) {
        self.convertedAmount = convertedAmount
        self.baseAmount = baseAmount
    }

    @Published var convertedAmount: Double
    @Published var baseAmount: Double

    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""

        return numberFormatter
    }
}
