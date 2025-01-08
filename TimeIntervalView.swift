//
//  TimeIntervalView.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/3/25.
//


import SwiftUI
struct TimeIntervalView: View{
    enum TimeInterval: String, CaseIterable, Identifiable{
        case week = "Weekly"
        case month = "Monthly"
        
        var id: Self { return self }
    }
   
    @State private var selectedTimeInterval = TimeInterval.week
    
    var body: some View{
        VStack(spacing: 20){
         
           Picker(selection: $selectedTimeInterval) {
                ForEach(TimeInterval.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label:{
                Text("Time period")
              
            }
            .pickerStyle(.menu)
            switch selectedTimeInterval {
            case .week:
                ChartView()
            case .month:
                ChartViewMonthly()
            }
            
        }
       
    }
}

