//
//  ContentView.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 26/3/26.
//

import SwiftUI
import Foundation

struct ContentView: View {

    @StateObject private var viewModel = ContentViewModel(convertedAmount: 0.0, baseAmount: 0.0)

    var body: some View {
        VStack(alignment: .leading, spacing: 40.0) {
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Amount")
                    .font(.body)
                    .fontWeight(.medium)
                TextField("", value: $viewModel.baseAmount, formatter: viewModel.numberFormatter)
                    .keyboardType(.decimalPad)
                    .font(.body)
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 8.0)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.clear)
                            .stroke(.gray, lineWidth: 1.5)
                    })
            }

            HStack {
                Spacer()
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 20.0, weight: .medium))
                    .foregroundStyle(.green)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Converted To")
                    .font(.body)
                    .fontWeight(.medium)
                TextField("", value: $viewModel.convertedAmount, formatter: viewModel.numberFormatter)
                    .keyboardType(.decimalPad)
                    .font(.body)
                    .padding(.horizontal, 10.0)
                    .padding(.vertical, 8.0)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(.clear)
                            .stroke(.gray, lineWidth: 1.5)
                    })
            }

            HStack {
                Spacer()
                Text("1.00000 USD = 10000 VND")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

