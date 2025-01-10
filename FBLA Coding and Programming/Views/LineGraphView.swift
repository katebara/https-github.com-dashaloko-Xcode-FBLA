//
//  LineGraphView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 1/3/25.
//

import SwiftUI
import Charts

struct LineGraphView: View {
    var data = [
        DataPoint(
            day: "Mon",
            dollars: 24.50,
            type: "Income"),
        
        DataPoint(
            day: "Mon",
            dollars: 20.50,
            type: "Expense")
    ]
                
    
    var body: some View {
        
        Chart {
            
            ForEach (data) { d in
                
                BarMark(x: PlottableValue.value("Day", d.day),
                         y: PlottableValue.value("Dollars", d.dollars))
                .annotation(position: .overlay) {
                    Text(String(d.dollars))
                        .foregroundColor(Color("white"))
                }
                .foregroundStyle(by: .value("Type", d.type))
                
            }
            
            
            
        }
        .chartYScale(range: .plotDimension(padding: 10))
        .frame(height:200)
        .padding()
        Spacer()
                

                    
    }
                    
}

#Preview {
    LineGraphView()
}
