//
//  CoinImageView.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 28/08/25.
//

import SwiftUI

struct CoinImageView: View {

    @StateObject var vm: CoinImageViewModel

    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }

    var body: some View {
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
                .foregroundStyle(Color.theme.secondaryText)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoinImageView(coin: CoinModel.mock)
        .padding()
}
