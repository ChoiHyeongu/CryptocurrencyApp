//
//  ContentView.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
  @State var handler: ((Result<ParsingData, Error>) -> Void)?
  @State var coins: [Coin] = [Coin(symbol: "...", name: "...", quote: Quote(USD: USD(price: 0, percent_change_24h: 0, percent_change_7d: 0)))]
  @ObservedObject var restManager = RestManager()
  
  let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
  var parsingData: ParsingData?
  
  var body: some View {
    NavigationView {
      List(coins, id:\.name) { coin in
        CoinRow(coin: coin)
      }
      .navigationBarTitle(Text("CryptocurrencyApp"))
      .onReceive(timer) { _ in
        print("Request")
        self.getCoinData()
      }
    }
    .onAppear {
      self.getCoinData()
    }
  }
  
  func getCoinData() {
    self.handler = { result in
      //guard let result = result else {return}
      switch result {
      case .success(let data):
        let allCoins = data.data as [Coin]
        self.coins = Array(allCoins.prefix(upTo: 10))
      case .failure(let error):
        print("Error", error.localizedDescription)
      }
    }
    
    restManager.getCoinData(completionHandler: handler!)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
