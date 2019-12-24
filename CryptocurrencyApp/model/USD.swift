//
//  USD.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/24.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Foundation

struct USD: Decodable {
    var price: Double
    var percentChange24h: Double
    var percentChange7d: Double
}
