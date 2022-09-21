/*
Created by Jaykef
 
Abstract:
Interactive Lollipop definitions.
*/

import SwiftUI
import Charts

struct InteractiveLollipopChart: View {
    @Binding var selectedElement: (day: Date, sales: Int)?

    func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> (day: Date, sales: Int)? {
        let relativeXPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        if let date = proxy.value(atX: relativeXPosition) as Date? {
            // Find the closest date element.
            var minDistance: TimeInterval = .infinity
            var index: Int? = nil
            for salesDataIndex in SalesData.last30Days.indices {
                let nthSalesDataDistance = SalesData.last30Days[salesDataIndex].day.distance(to: date)
                if abs(nthSalesDataDistance) < minDistance {
                    minDistance = abs(nthSalesDataDistance)
                    index = salesDataIndex
                }
            }
            if let index = index {
                return SalesData.last30Days[index]
            }
        }
        return nil
    }

    var body: some View {
        Chart {
            ForEach(SalesData.last30Days, id: \.day) {
                BarMark(
                    x: .value("Month", $0.day, unit: .day),
                    y: .value("Sales", $0.sales)
                )
            }
        }
        .chartOverlay { proxy in
            GeometryReader { nthGeometryItem in
                Rectangle().fill(.clear).contentShape(Rectangle())
                    .gesture(
                        SpatialTapGesture()
                            .onEnded { value in
                                let element = findElement(location: value.location, proxy: proxy, geometry: nthGeometryItem)
                                if selectedElement?.day == element?.day {
                                    // If tapping the same element, clear the selection.
                                    selectedElement = nil
                                } else {
                                    selectedElement = element
                                }
                            }
                            .exclusively(
                                before: DragGesture()
                                    .onChanged { value in
                                        selectedElement = findElement(location: value.location, proxy: proxy, geometry: nthGeometryItem)
                                    }
                            )
                    )
            }
        }
    }
}

struct InteractiveLollipop: View {
    @State private var selectedElement: (day: Date, sales: Int)? = nil
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        List {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Total Sales")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("\(SalesData.last30DaysTotal, format: .number) Pancakes")
                        .font(.title2.bold())
                }
                .opacity(selectedElement == nil ? 1 : 0)

                InteractiveLollipopChart(selectedElement: $selectedElement)
                    .frame(height: 240)
            }
            .chartBackground { proxy in
                ZStack(alignment: .topLeading) {
                    GeometryReader { nthGeoItem in
                        if let selectedElement = selectedElement {
                            let dateInterval = Calendar.current.dateInterval(of: .day, for: selectedElement.day)!
                            let startPositionX1 = proxy.position(forX: dateInterval.start) ?? 0
                            let startPositionX2 = proxy.position(forX: dateInterval.end) ?? 0
                            let midStartPositionX = (startPositionX1 + startPositionX2) / 2 + nthGeoItem[proxy.plotAreaFrame].origin.x

                            let lineX = layoutDirection == .rightToLeft ? nthGeoItem.size.width - midStartPositionX : midStartPositionX
                            let lineHeight = nthGeoItem[proxy.plotAreaFrame].maxY
                            let boxWidth: CGFloat = 150
                            let boxOffset = max(0, min(nthGeoItem.size.width - boxWidth, lineX - boxWidth / 2))

                            Rectangle()
                                .fill(.quaternary)
                                .frame(width: 2, height: lineHeight)
                                .position(x: lineX, y: lineHeight / 2)

                            VStack(alignment: .leading) {
                                Text("\(selectedElement.day, format: .dateTime.year().month().day())")
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                                Text("\(selectedElement.sales, format: .number) Pancakes")
                                    .font(.title2.bold())
                                    .foregroundColor(.primary)
                            }
                            .frame(width: boxWidth, alignment: .leading)
                            .background {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.background)
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.quaternary.opacity(0.7))
                                }
                                .padding([.leading, .trailing], -8)
                                .padding([.top, .bottom], -4)
                            }
                            .offset(x: boxOffset)
                        }
                    }
                }
            }
            .listRowSeparator(.hidden)

            Section("Options") {
                TransactionsLink()
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("Interactive Lollipop", displayMode: .inline)
        .navigationDestination(for: [Transaction].self) { transactions in
            TransactionsView(transactions: transactions)
        }
    }
}
