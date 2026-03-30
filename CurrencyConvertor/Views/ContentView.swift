//
//  ContentView.swift
//  CurrencyConvertor
//
//  Created by Nguyễn Gia Huy on 26/3/26.
//

import SwiftUI
import Foundation

struct ContentView: View {

    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 40.0) {
                HStack {
                    Text(viewModel.errorMsg)
                        .fontWeight(.medium)
                        .foregroundStyle(.red)
                }
                VStack(alignment: .leading, spacing: 12.0) {
                    Text("Amount")
                        .font(.body)
                        .fontWeight(.medium)
                    TextField("", value: $viewModel.baseAmount, formatter: viewModel.numberFormatter)
                        .keyboardType(.decimalPad)
                        .font(.body)
                        .padding(.horizontal, 12.0)
                        .padding(.vertical, 16.0)

                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(.clear)
                                .stroke(.gray, lineWidth: 1.5)
                        })
                        .overlay(alignment: .trailing, content: {
                            Menu(content: {
                                ForEach(CurrencyChoice.allCases, id: \.id, content: { currencyChoice in Button(action: {
                                    viewModel.baseCurrency = currencyChoice
                                }, label: { Text(currencyChoice.fetchMenuName()) })
                                })
                            }, label: {
                                HStack(spacing: 4.0) {
                                    viewModel.baseCurrency.image()
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 30.0, maxHeight: 30.0)
                                        .clipShape(Circle())
                                    Text(viewModel.baseCurrency.rawValue)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Image(systemName: "chevron.down")
                                        .font(.caption)
                                }.foregroundStyle(.black)
                            }).padding(.trailing, 8.0)
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
                        .padding(.horizontal, 12.0)
                        .padding(.vertical, 16.0)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(.clear)
                                .stroke(.gray, lineWidth: 1.5)
                        })
                        .overlay(alignment: .trailing, content: {
                            Menu(content: {
                                ForEach(CurrencyChoice.allCases, id: \.id, content: { currencyChoice in Button(action: {
                                    viewModel.convertedCurrency = currencyChoice
                                }, label: { Text(currencyChoice.fetchMenuName()) })
                                })
                            }, label: {
                                HStack(spacing: 4.0) {
                                    viewModel.convertedCurrency.image()
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 30.0, maxHeight: 30.0)
                                        .clipShape(Circle())
                                    Text(viewModel.convertedCurrency.rawValue)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Image(systemName: "chevron.down")
                                        .font(.caption)
                                }.foregroundStyle(.black)

                            }).padding(.trailing, 8.0)
                        })
                }

                HStack {
                    Spacer()
                    Text("\(viewModel.baseAmount) \(viewModel.baseCurrency.rawValue) = \(viewModel.convertedAmount) \(viewModel.convertedCurrency.rawValue)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Spacer()
                }
            }
            .padding()
            .task {
                await viewModel.fetchRates()
            }

            if viewModel.isLoading == true {
                ZStack {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                    ProgressView()
                        .tint(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

