//
//  HTTPManager.swift
//  CryptocurrencyApp
//
//  Created by Choi on 2019/12/23.
//  Copyright © 2019 motivatin. All rights reserved.
//

import Alamofire
import Foundation

class RestManager {
    static let shared: RestManager = RestManager()
    
    private var request: DataRequest? {
        didSet {
            oldValue?.cancel()
        }
    }
    
    private var reachability: NetworkReachabilityManager!
    
    private init() {
        monitorReachability()
    }
    
    private func monitorReachability() {
        reachability = NetworkReachabilityManager(host: "www.apple.com")
        
        let listener: NetworkReachabilityManager.Listener = { status in
            print("Reachability Status Changed: \(status)")
        }
        
        reachability.startListening(onUpdatePerforming: listener)
    }
    
    func getCoinData(completionHandler: @escaping (Result<ParsingData, Error>) -> Void) {
        self.request = AF.request("\(Config.baseURL)", headers: ["X-CMC_PRO_API_KEY":Config.API_KEY])
        self.request?.responseDecodable{ (response: DataResponse<ParsingData, AFError>) in
            switch response.result {
            case .success(let coinDatas):
                print("success")
                completionHandler(.success(coinDatas))
            case .failure(let error):
                print("fail")
                completionHandler(.failure(error))
            }
        }
    }
}
