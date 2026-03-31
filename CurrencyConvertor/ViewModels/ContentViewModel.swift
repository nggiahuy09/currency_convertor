//
//  ContentViewModel.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 29/3/26.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {

    init() {
        self.baseAmount = 0.0;
        self.baseCurrency = .Usa;
        self.convertedAmount = 0.0;
        self.convertedCurrency = .Vietnam;
        self.rates = Rates(rates: ["": 0.0]);
        self.isLoading = false;
        self.errorMsg = "";
    }

    @Published var baseAmount: Double
    @Published var baseCurrency: CurrencyChoice
    @Published var convertedAmount: Double
    @Published var convertedCurrency: CurrencyChoice
    @Published var rates: Rates
    @Published var isLoading: Bool
    @Published var errorMsg: String

    var conversionRate: Double {
        if let baseExchangeRate = rates.rates[baseCurrency.rawValue],
           let convertedExchangedRate = rates.rates[convertedCurrency.rawValue] {
            return convertedExchangedRate / baseExchangeRate
        }
        return 1.0
    }

    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter
    }

    func fetchRates() async {
        let baseUrl = "https://openexchangerates.org/api/latest.json?app_id=\(Secrets.appId)"
        guard let url = URL(string: baseUrl) else {
            errorMsg = "API url is not valid..."
            return
        }

        let urlRequest = URLRequest(url: url)
        isLoading = true

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            rates = try JSONDecoder().decode(Rates.self, from: data)
        } catch {
            errorMsg = "Could not fetch rates. Please try again later.\n\(error.localizedDescription)"
            print(error.localizedDescription)
        }
        isLoading = false
    }

    func convert() {
        if let baseExchangeRate = rates.rates[baseCurrency.rawValue],
           let convertedExchangedRate = rates.rates[convertedCurrency.rawValue] {
            convertedAmount = (convertedExchangedRate / baseExchangeRate) * baseAmount
        }
    }
}

