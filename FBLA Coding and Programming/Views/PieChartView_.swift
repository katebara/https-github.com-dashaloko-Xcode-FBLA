//
//  PieChart.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/1/25.
//
import Foundation
struct PieChartData: Identifiable{
    var id = UUID()
    var type: String
    var amount: Double
}



import SwiftUI
import Charts

struct PieChartView_: View {
    
    let data: [PieChartData] = [
        PieChartData(type: "Housing", amount: 500),
        PieChartData(type: "Food", amount: 410 ),
        PieChartData(type: "Transportation", amount: 245),
        PieChartData(type: "Clothing", amount: 600),
        PieChartData(type: "Other", amount: 100)
    ]
    
    var body: some View {
        VStack {
            Text("Expense breakdown")
                .font(.headline)
                .padding()
            
            Chart(data) { item in
                SectorMark(
                    angle: .value("Amount", item.amount),
                    innerRadius: .ratio(0.5),
                    outerRadius: .ratio(1.0)
                )
                .foregroundStyle(by: .value("Type", item.type))
            }
            .frame(height: 200)
        }
        .padding()
    }
}
