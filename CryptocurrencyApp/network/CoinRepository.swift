//
//  HTTPManager.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Alamofire
import Foundation

class CoinRepository: ObservableObject {
  static let shared = CoinRepository()

  @Published var CoinData: CoinData?
  
  private var request: DataRequest? {
    didSet {
      oldValue?.cancel()
    }
  }
  
  private var reachability: NetworkReachabilityManager!

  init() {
    monitorReachability()
  }

  private func monitorReachability() {
    reachability = NetworkReachabilityManager(host: "www.apple.com")

    let listener: NetworkReachabilityManager.Listener = { status in
      print("Reachability Status Changed: \(status)")
    }

    reachability.startListening(onUpdatePerforming: listener)
  }

  func getCoinData(completionHandler: @escaping (Result<CoinData, Error>) -> Void) {
    request = AF.request("\(Config.baseURL)", headers: ["X-CMC_PRO_API_KEY": Config.API_KEY])
    request?.responseDecodable { (response: DataResponse<CoinData, AFError>) in
      switch response.result {
      case let .success(userDatas):
        completionHandler(.success(userDatas))
      case let .failure(error):
        completionHandler(.failure(error))
      }
    }
  }
}
