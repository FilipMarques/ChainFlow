//
//  HomeViewModel.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 13/08/25.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(CoinModel.mock)
            self.portfolioCoins.append(CoinModel.mock)
        }
    }

}
