//
//  StatisticView.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 02/09/25.
//

import SwiftUI

struct StatisticView: View {

    let stat: StatisticModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)

            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees:(stat.percentageChange ?? 0) >= 0 ? 0 : 180))

                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview("Stat 1 - Light", traits: .sizeThatFitsLayout) {
    StatisticView(stat: StatisticModel.stat1)
        .preferredColorScheme(.light)
}

#Preview("Stat 1 - Dark", traits: .sizeThatFitsLayout) {
    StatisticView(stat: StatisticModel.stat2)
        .preferredColorScheme(.dark)
}

#Preview("Stat 2", traits: .sizeThatFitsLayout) {
    StatisticView(stat: StatisticModel.stat3)
}

