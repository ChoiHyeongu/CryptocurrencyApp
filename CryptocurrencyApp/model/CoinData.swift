//
//  ParseData.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/24.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    var status: StatusData
    var data: [Coin]
}
