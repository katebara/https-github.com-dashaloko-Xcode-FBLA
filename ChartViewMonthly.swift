//
//  ChartViewMonthly.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/3/25.
//


import SwiftUI
import Charts

struct MonthlyData: Identifiable {
    var id = UUID().uuidString
    var month: String
    var income: Double
    var expense: Double
}

struct ChartViewMonthly: View {
    var monthlyData = [
        MonthlyData(month: "Jan", income: 100.00, expense: 50.00),
        MonthlyData(month: "Feb", income: 200.00, expense: 80.00),
        MonthlyData(month: "Mar", income: 120.00, expense: 40.00),
        MonthlyData(month: "Apr", income: 200.00, expense: 30.00),
        MonthlyData(month: "May", income: 300.00, expense: 53.00),
        MonthlyData(month: "Jun", income: 700.00, expense: 300.00),
        MonthlyData(month: "Jul", income: 100.00, expense: 10.00),
        MonthlyData(month: "Aug", income: 500.00, expense: 10.00),
        MonthlyData(month: "Sep", income: 550.00, expense: 99.00),
        MonthlyData(month: "Oct", income: 100.00, expense: 20.00),
        MonthlyData(month: "Nov", income: 100, expense: 100.00),
        MonthlyData(month: "Dec", income: 660.00, expense: 500.00),
    ]
    
    var body: some View {
        Chart {
        
            ForEach(monthlyData) { data in
                BarMark(
                    x: .value("Month", data.month),
                    y: .value("Income", data.income)
                )
                .foregroundStyle(.green)
             
                
                BarMark(
                    x: .value("Month", data.month),
                    y: .value("Expense", data.expense)
                )
                .foregroundStyle(.red)
               
            }
        }
        .padding()
    }
}

struct ChartViewMonthly_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}






