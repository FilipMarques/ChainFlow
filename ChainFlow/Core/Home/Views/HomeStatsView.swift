//
//  Home.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 02/09/25.
//

import SwiftUI

struct HomeStatsView: View {

    let statistics = StatisticModel.mockList
    @Binding var showPortfolio: Bool

    var body: some View {
        HStack {
            ForEach(statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
}
