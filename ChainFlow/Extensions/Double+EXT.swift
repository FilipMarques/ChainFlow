//
//  Double+EXT.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 12/08/25.
//

import Foundation

extension Double {

    /// Formata o número como valor monetário com exatamente 2 casas decimais.
    ///
    /// - Usa separador de milhar (`1,000` em vez de `1000`).
    /// - Aplica estilo `.currency`.
    /// - Locale padrão: `.current` (do dispositivo), mas com moeda fixada como USD.
    /// - Símbolo de moeda forçado para "$".
    /// - Casas decimais: mínimo e máximo de 2 (valor sempre com duas casas).
    ///
    /// **Exemplos:**
    /// ```swift
    /// 1234.5   -> "$1,234.50"
    /// 0.1      -> "$0.10"
    /// 12       -> "$12.00"
    /// ```
        private var currencyFormatter2: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.usesGroupingSeparator = true // Ex.: 1,000 em vez de 1000
            formatter.numberStyle = .currency // Aplica formatação monetária
            formatter.locale = .current // Padrão: locale do dispositivo
//            formatter.currencyCode = "usd" // Sobrescreve o código detectado pelo locale para USD
//            formatter.currencySymbol = "$" // Sobrescreve o símbolo detectado pelo locale para "$"
            formatter.minimumFractionDigits = 2 // Exibe exatamente 2 casas decimais
            formatter.maximumFractionDigits = 2 // Exibe exatamente 2 casas decimais
            return formatter
        }

    /// Formata o número como valor monetário com até 6 casas decimais.
    ///
    /// - Usa separador de milhar (`1,000` em vez de `1000`).
    /// - Aplica estilo `.currency`.
    /// - Locale padrão: `.current` (do dispositivo), mas com moeda fixada como USD.
    /// - Símbolo de moeda forçado para "$".
    /// - Casas decimais: mínimo de 2 e máximo de 6.
    ///
    /// **Exemplos:**
    /// ```swift
    /// 1234.5   -> "$1,234.50"
    /// 0.123456 -> "$0.123456"
    /// 12.1     -> "$12.10"
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true // Ex.: 1,000 em vez de 1000
        formatter.numberStyle = .currency // Aplica formatação monetária
        formatter.locale = .current // Padrão: locale do dispositivo
//        formatter.currencyCode = "usd" // Sobrescreve o código detectado pelo locale para USD
//        formatter.currencySymbol = "$" // Sobrescreve o símbolo detectado pelo locale para "$"
        formatter.minimumFractionDigits = 2 // Exibe pelo menos 2 casas decimais
        formatter.maximumFractionDigits = 6 // Exibe no máximo 6 casas decimais
        return formatter
    }

    public func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }

    public func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }

    public func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    public func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
