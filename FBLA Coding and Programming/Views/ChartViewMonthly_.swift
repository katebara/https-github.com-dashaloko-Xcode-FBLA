import SwiftUI
import Charts

struct ChartViewMonthly_: View {
    var entries: [Entry]

    var body: some View {
        Chart {
            ForEach(prepareMonthlyData(), id: \.date) { entry in
                BarMark(
                    x: .value("Month", entry.date),
                    y: .value("Amount", entry.totalAmount)
                        
                )
                .foregroundStyle(Color("yellow")) // Customize color
                .annotation(position: .top) {
                                    Text("\(Int(entry.totalAmount))") // Display total amount as integer
                                        .font(.caption)
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Capsule().fill(Color.white).shadow(radius: 2))
                                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }

    // Prepare data grouped by month
    private func prepareMonthlyData() -> [(date: Date, totalAmount: Double)] {
        let calendar = Calendar.current
        
        // Group entries by month
        let groupedEntries = Dictionary(grouping: entries) { entry in
            // Get the start of the month for each entry
            return calendar.dateInterval(of: .month, for: entry.date)?.start ?? entry.date
        }
        
        // Prepare total amount for each month
        return groupedEntries.map { (monthStartDate, entriesInMonth) in
            let totalAmount = entriesInMonth.reduce(0) { $0 + $1.amount }
            return (monthStartDate, totalAmount)
        }
    }
}

struct ChartViewMonthly__Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of EntryInputViewViewModel
        let viewModel = EntryInputViewViewModel()

        // Return the ChartViewMonthly_ with the viewModel's entries
        ChartViewMonthly_(entries: viewModel.entries)
    }
}
