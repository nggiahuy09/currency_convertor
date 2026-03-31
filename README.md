# 💱 Currency Convertor

A simple iOS app that converts between world currencies using live exchange rates from the [Open Exchange Rates](https://openexchangerates.org/) API.

> 📚 This is a beginner-friendly project built to practise network calls in Swift using modern `async/await` and `URLSession`.

---

## ✨ Features

- 🌍 Supports **130+ world currencies**
- 🔄 Select a source currency and a target currency, enter an amount, and get the converted value instantly
- 📊 Displays the **live exchange rate** between the two selected currencies
- 🏳️ Each currency entry shows its **country flag** and full currency name
- ⚡ Fetches live rates on app launch with a loading indicator
- ⚠️ Friendly error message when the network request fails

---

## 🏗️ Architecture

The project follows the **MVVM (Model-View-ViewModel)** pattern:

| Layer | File | Responsibility |
|-------|------|----------------|
| **Model** | `Rates.swift` | Decodable struct that maps the API JSON response |
| **Model** | `CurrencyChoice.swift` | Enum of all supported currencies with helper methods for flag images and display names |
| **ViewModel** | `ContentViewModel.swift` | Holds app state, fetches exchange rates via `URLSession`, and exposes a `convert()` method |
| **View** | `ContentView.swift` | SwiftUI view that observes the ViewModel and renders the UI |

### Networking

- Uses **`async/await`** with `URLSession` — the modern Swift concurrency model
- The ViewModel is annotated with `@MainActor` so all published state updates happen on the main thread automatically

---

## 📱 Screenshots

| Main Screen |
|---|
| Select source and target currencies from a dropdown menu, enter an amount, and view the converted result along with the live exchange rate. |

---

## 🚀 Getting Started

### Prerequisites

- Xcode 14 or later
- iOS 16+ deployment target
- A free API key from [Open Exchange Rates](https://openexchangerates.org/signup/free)

### Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/nggiahuy09/currency_convertor.git
   cd currency_convertor
   ```

2. **Add your API key**

   The project reads the API key from a local configuration file that is **not** committed to source control.

   - Duplicate `Secrets.example.xcconfig` and rename the copy to `Secrets.xcconfig`:

     ```bash
     cp CurrencyConvertor/Secrets.example.xcconfig CurrencyConvertor/Secrets.xcconfig
     ```

   - Open `Secrets.xcconfig` and replace `YOUR_APP_ID` with your actual key:

     ```
     CURRENCY_EXCHANGE_APP_ID=your_real_app_id_here
     ```

3. **Open and run the project**

   ```bash
   open CurrencyConvertor.xcodeproj
   ```

   Select a simulator or a real device in Xcode and press **⌘ R** to build and run.

---

## 🔑 API

The app calls the **Open Exchange Rates** `/api/latest.json` endpoint:

```
GET https://openexchangerates.org/api/latest.json?app_id=<YOUR_APP_ID>
```

The response is decoded into the `Rates` model:

```swift
struct Rates: Decodable {
    let rates: [String: Double]
}
```

---

## 📂 Project Structure

```
CurrencyConvertor/
├── CurrencyConvertorApp.swift   # App entry point
├── Models/
│   ├── CurrencyChoice.swift     # Supported currencies enum
│   └── Rates.swift              # API response model
├── ViewModels/
│   └── ContentViewModel.swift   # Business logic & networking
├── Views/
│   └── ContentView.swift        # SwiftUI UI layer
├── SecretsDecoder.swift         # Reads API key from Info.plist
├── Secrets.xcconfig             # Local API key (git-ignored)
└── Secrets.example.xcconfig     # Template for the above
```

---

## 🌐 Supported Currencies

The app supports all major and many minor world currencies, including:

`USD` · `EUR` · `GBP` · `JPY` · `CAD` · `AUD` · `CHF` · `CNY` · `INR` · `BRL` · `MXN` · `KRW` · `SGD` · `HKD` · `NOK` · `SEK` · `DKK` · `NZD` · `ZAR` · `RUB` · `TRY` · `VND` · `THB` · `MYR` · `IDR` · and **100+ more**.

---

## 🛠️ Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Networking:** URLSession with `async/await`
- **Architecture:** MVVM
- **API:** [Open Exchange Rates](https://openexchangerates.org/)

---

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).
