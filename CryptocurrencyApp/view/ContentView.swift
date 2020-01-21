//
//  ContentView.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Combine
import SwiftUI

struct ContentView: View {
  @ObservedObject var coinListViewModel = CoinListViewModel()
  let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

  var body: some View {
    NavigationView {
      List(coinListViewModel.coins, id: \.name) { coin in
        CoinRow(coin: coin)
      }
      .navigationBarTitle(Text("CryptocurrencyApp"))
      .onReceive(timer) { _ in
        print("Request")
        self.coinListViewModel.getCoinData()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
