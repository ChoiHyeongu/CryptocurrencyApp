//
//  CoinListViewModel.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2020/01/21.
//  Copyright © 2020 motivatin. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class CoinListViewModel: ObservableObject {
  @Published var coins: [Coin] = []
  
  var coinData: CoinData?
  
  init() {
    self.getCoinData()
    print(coins)
  }

  func getCoinData() {
    CoinRepository.shared.getCoinData { result in
      switch result {
      case let .success(data):
        let allCoins = data.data as [Coin]
        self.coins = Array(allCoins.prefix(upTo: 10))
      case let .failure(error):
        print("Error", error.localizedDescription)
      }
    }
  }
}
