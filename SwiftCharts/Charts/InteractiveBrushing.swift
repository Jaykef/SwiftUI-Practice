/*
Created by Jaykef
 
Abstract:
Interactive Brushing definitions.
*/

import SwiftUI
import Charts

struct InteractiveBrushingChart: View {
    @Binding var range: (Date, Date)?

    var body: some View {
        Chart {
            ForEach(SalesData.last30Days, id: \.day) {
                LineMark(
                    x: .value("Month", $0.day, unit: .day),
                    y: .value("Sales", $0.sales)
                )
                .interpolationMethod(.catmullRom)
                .symbol(Circle().strokeBorder(lineWidth: 2))
            }
            if let (start, end) = range {
                RectangleMark(
                    xStart: .value("Selection Start", start),
                    xEnd: .value("Selection End", end)
                )
                .foregroundStyle(.gray.opacity(0.2))
            }
        }
        .chartOverlay { proxy in
            GeometryReader { nthGeoItem in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .gesture(DragGesture()
                        .onChanged { value in
                            // Find the x-coordinates in the chart’s plot area.
                            let xStart = value.startLocation.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                            let xCurrent = value.location.x - nthGeoItem[proxy.plotAreaFrame].origin.x
                            // Find the date values at the x-coordinates.
                            if let dateStart: Date = proxy.value(atX: xStart),
                               let dateCurrent: Date = proxy.value(atX: xCurrent) {
                                range = (dateStart, dateCurrent)
                            }
                        }
                        .onEnded { _ in range = nil } // Clear the state on gesture end.
                    )
            }
        }
    }
}

struct InteractiveBrushing: View {
    @State private var range: (Date, Date)? = nil

    var rows: [(day: Date, sales: Int)] {
        if let range = range {
            if range.0 < range.1 {
                return SalesData.last30Days.filter { $0.day >= range.0 && $0.day <= range.1 }
            } else {
                return SalesData.last30Days.filter { $0.day >= range.1 && $0.day <= range.0 }
            }
        } else {
            return SalesData.last30Days
        }
    }

    var isBrushing: Bool {
        range != nil && !rows.isEmpty
    }

    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(
                    isBrushing
                    ? "Sales from \(rows.first!.day, format: .dateTime.month().day()) to \(rows.last!.day, format: .dateTime.month().day())"
                    : "Total Sales"
                )
                .font(.callout)
                .foregroundStyle(.secondary)
                
                Text(
                    isBrushing
                    ? "\(rows.map(\.sales).reduce(0, +), format: .number) Pancakes"
                    : "\(SalesData.last30DaysTotal, format: .number) Pancakes"
                )
                .font(.title2.bold())

                InteractiveBrushingChart(range: $range)
                    .frame(height: 240)
                    .padding(.bottom)

                Text("Details")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 4)
                VStack(alignment: .leading) {
                    ForEach(rows, id: \.day) {
                        Text("\($0.day, format: .dateTime.year().month().day()), sales: \($0.sales, format: .number)")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarTitle("Interactive Brushing", displayMode: .inline)
    }
}
