//
//  StatisticModel.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 02/09/25.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?

    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

extension StatisticModel {
    static let stat1 = StatisticModel(
        title: "Market Cap",
        value: "$12.28n",
        percentageChange: 25.34
    )

    static let stat2 = StatisticModel(
        title: "Total Volume",
        value: "$1.23Tr"
    )

    static let stat3 = StatisticModel(
        title: "Portfolio Value",
        value: "$50.4k",
        percentageChange: -12.34
    )

    static let stat4 = StatisticModel(
        title: "Title",
        value: "Value",
        percentageChange: -7
    )

    static let mockList: [StatisticModel] = [
        .stat1,
        .stat2,
        .stat3,
        .stat4
    ]
}
