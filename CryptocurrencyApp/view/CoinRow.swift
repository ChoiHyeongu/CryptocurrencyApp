//
//  CoinRow.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/26.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct CoinRow: View {
  
  var coin: Coin
  
  var body: some View {
    VStack{
      HStack{
        coinName
        Spacer()
        Text("$ \(self.coin.quote.USD.price)")
          .fontWeight(.bold)
      }.padding()
      percentageView
    }
  }
  
  var percentageView: some View {
    HStack {
      Text("24h: \(self.roundPercentage(coin.quote.USD.percent_change_24h))")
        .foregroundColor(coin.quote.USD.percent_change_24h < 0 ? .red : .blue)
      Spacer()
      Text("24h: \(self.roundPercentage(coin.quote.USD.percent_change_7d))")
        .foregroundColor(coin.quote.USD.percent_change_7d < 0 ? .red : .blue)
    }
    .padding(.leading, 55)
    .padding(.trailing, 15)
  }
  
  var coinName: some View {
    HStack{
      Image(coin.symbol)
        .resizable()
        .frame(width: 30, height: 30)
      Text(coin.symbol)
        .fontWeight(.bold)
      Text("|")
        .fontWeight(.semibold)
      Text(coin.name)
    }
  }
  
  func roundPercentage(_ percentage: Double) -> String{
    let numberFormatter = NumberFormatter()
    numberFormatter.roundingMode = .halfUp
    numberFormatter.minimumSignificantDigits = 2
    numberFormatter.maximumSignificantDigits = 2
    return numberFormatter.string(from: NSNumber(value: percentage)) ?? "0"
  }
}

struct CoinRow_Previews: PreviewProvider {
  static let coin = Coin(symbol: "BTC", name: "Bitcoin", quote: Quote(USD: USD(price: 10.0, percent_change_24h: 10.0, percent_change_7d: 10.0)))
  
  static var previews: some View {
    CoinRow(coin: self.coin)
  }
}
