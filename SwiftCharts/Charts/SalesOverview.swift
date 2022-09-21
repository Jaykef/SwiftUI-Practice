/*
 Created by Jaykef
 
Abstract:
Sales Overview definitions.
*/

import Charts
import SwiftUI

struct SalesOverviewChart: View {
    var body: some View {
        Chart(SalesData.last30Days, id: \.day) {
            BarMark(
                x: .value("Day", $0.day, unit: .day),
                y: .value("Sales", $0.sales)
            )
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}

struct SalesOverview: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Total Sales")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("\(SalesData.last30DaysTotal, format: .number) Pancakes")
                .font(.title2.bold())

            SalesOverviewChart()
                .frame(height: 100)
        }
    }
}

struct SalesOverview_Previews: PreviewProvider {
    static var previews: some View {
        SalesOverview()
            .padding()
    }
}
