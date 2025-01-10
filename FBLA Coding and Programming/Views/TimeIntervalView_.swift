//
//  TimeIntervalView.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/3/25.
//


import SwiftUI

struct TimeIntervalView_: View {
    enum TimeInterval: String, CaseIterable, Identifiable {
        case week = "Weekly"
        case month = "Monthly"
        
        var id: Self { return self }
    }

    @State private var selectedTimeInterval = TimeInterval.week
    @ObservedObject var viewModel: EntryInputViewViewModel

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selectedTimeInterval) {
                ForEach(TimeInterval.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time period")
            }
            .pickerStyle(.menu)

            switch selectedTimeInterval {
            case .week:
                WeeklyChartView(entries: viewModel.entries)
            case .month:
                ChartViewMonthly_(entries: viewModel.entries)
            }
        }
    }
}

struct TimeIntervalView__Previews: PreviewProvider {
    static var previews: some View {
        // Use sample entries for preview
        TimeIntervalView_(viewModel: EntryInputViewViewModel())
    }
}
