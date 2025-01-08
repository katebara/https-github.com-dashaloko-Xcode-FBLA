
import SwiftUI
import Charts

struct WeeklyData: Identifiable {
    var id = UUID().uuidString
    var day: String
    var income: Double
    var expense: Double
}

struct ChartView: View {
    var weeklyData = [
        WeeklyData(day: "Mon", income: 2000.00, expense: 500.00),
        WeeklyData(day: "Tue", income: 2999.00, expense: 5000.00),
        WeeklyData(day: "Wed", income: 100.00, expense: 0.00),
        WeeklyData(day: "Thu", income: 190.00, expense: 120.00),
        WeeklyData(day: "Fri", income: 9000.00, expense: 50.00),
        WeeklyData(day: "Sat", income: 2000.00, expense: 500.00),
        WeeklyData(day: "Sun", income: 4050.00, expense: 1000.00),
    ]
    
    var body: some View {
        Chart {
            ForEach(weeklyData) { data in
                BarMark(
                    x: .value("Day", data.day),
                    y: .value("Income", data.income)
                )
                .foregroundStyle(.green)
            
                
                BarMark(
                    x: .value("Day", data.day),
                    y: .value("Expense", data.expense)
                )
                .foregroundStyle(.red)
               
            }
        }
        .padding() // Add some padding around the chart
    }

}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}






