//
//  CoinRow.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Foundation

struct Coin: Codable {
  var symbol: String
  var name: String
  var quote: Quote
}
