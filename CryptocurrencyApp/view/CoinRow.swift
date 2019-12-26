//
//  CoinRow.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/26.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct CoinRow: View {
  
  let coin: Coin
  
  var body: some View {
    VStack{
      Text(self.coin.name)
    }
  }
}

struct CoinRow_Previews: PreviewProvider {
  static let coin = Coin(symbol: "BTC", name: "Bitcoin", quote: Quote(USD: USD(price: 10.0, percent_change_24h: 10.0, percent_change_7d: 10.0)))
  
  static var previews: some View {
    CoinRow(coin: self.coin)
  }
}
