//
//  CoinModel.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 11/08/25.
//

import Foundation

/// Modelo que representa os dados retornados pelo endpoint `/coins/markets` da CoinGecko,
/// incluindo o sparkline de preço nos últimos 7 dias.
struct CoinModel: Codable, Identifiable {

    // Identificação básica
    let id: String
    let symbol: String
    let name: String
    let image: URL

    // Preço e mercado
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Int?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?

    // Variações nas últimas 24h
    let high24h: Double?
    let low24h: Double?
    let priceChange24h: Double?
    let priceChangePercentage24h: Double?
    let marketCapChange24h: Double?
    let marketCapChangePercentage24h: Double?

    // Supply
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?

    // Preço histórico (ATH/ATL)
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: Date?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: Date?

    // Sparkline (7 dias de preços)
    struct SparklineIn7D: Codable {
        let price: [Double]
    }

    let sparklineIn7D: SparklineIn7D?

    // Variação de preço em moeda local nos últimos 24h
    let priceChangePercentage24hInCurrency: Double?

    // Timestamp da última atualização
    let lastUpdated: Date?

    let currentHoldings: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24hInCurrency = "price_change_percentage_24h_in_currency"
        case lastUpdated = "last_updated"
        case currentHoldings
    }

    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24h: high24h,
            low24h: low24h,
            priceChange24h: priceChange24h,
            priceChangePercentage24h: priceChangePercentage24h,
            marketCapChange24h: marketCapChange24h,
            marketCapChangePercentage24h: marketCapChangePercentage24h,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency,
            lastUpdated: lastUpdated,
            currentHoldings: amount
        )
    }

    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }

    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}
