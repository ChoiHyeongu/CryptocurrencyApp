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
    
    var body: some View {
        Text("HI")
            .onAppear {
                self.getCoinData()
            }
    }
    
    func getCoinData() {
        self.handler = { result in
            //guard let result = result else {return}
            print(result)
            switch result {
            case .success(let data):
                guard let coinData = data.status?.error_code else { return }
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
