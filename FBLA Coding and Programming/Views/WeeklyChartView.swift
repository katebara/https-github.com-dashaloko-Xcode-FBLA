
import SwiftUI
import Charts

struct WeeklyChartView: View {
    var entries: [Entry]

    var body: some View {
        Chart {
            ForEach(prepareWeeklyData(), id: \.date) { entry in
                BarMark(
                    x: .value("Week", entry.date),
                    y: .value("Amount", entry.totalAmount)
                )
                .foregroundStyle(.blue) // Customize color
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    // Prepare data grouped by week
    private func prepareWeeklyData() -> [(date: Date, totalAmount: Double)] {
        let calendar = Calendar.current
        
        // Group entries by week
        let groupedEntries = Dictionary(grouping: entries) { entry in
            // Get the start of the week for each entry
            return calendar.dateInterval(of: .weekOfYear, for: entry.date)?.start ?? entry.date
        }
        
        // Prepare total amount for each week
        return groupedEntries.map { (weekStartDate, entriesInWeek) in
            let totalAmount = entriesInWeek.reduce(0) { $0 + $1.amount }
            return (weekStartDate, totalAmount)
        }
    }
}

