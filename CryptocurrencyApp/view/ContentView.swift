//
//  ContentView.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State var handler: ((Result<ParsingData, Error>) -> Void)?
  @State var parsingData: ParsingData?
  @State var coins: [Coin] = [Coin(symbol: "BTC", name: "Bitcoin", quote: Quote(USD: USD(price: 10.0, percent_change_24h: 10.0, percent_change_7d: 10.0)))]
  var restMananger = RestManager()
  
  var body: some View {
//    NavigationView {
//      List(coins, id:\.name) { coin in
//        Text(coin.name)
//      }
//    }.onAppear {
//      self.getCoinData()
//      self.parsingData = self.restMananger.parsingData
//      self.coins = self.parsingData!.data
//    }
    
    Text("123").onAppear{
      self.getCoinData()
    }
  }
  
  func getCoinData() {
    self.handler = { result in
      //guard let result = result else {return}
      print(result)
      switch result {
      case .success(let data):
        guard let coinData = data.status.error_code else { return }
        print (coinData)
      case .failure(let error):
        print("Error", error.localizedDescription)
      }
    }
    
    RestManager.shared.getCoinData(completionHandler: handler!)

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
