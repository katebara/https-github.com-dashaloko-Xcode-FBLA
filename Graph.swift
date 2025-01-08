//Show Expense and Income shapes
//  Graph.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 12/30/24.
//

import SwiftUI

struct GraphView: View {
    
    var body: some View {
        Spacer().frame(height:90)
        
        HStack {

            
            
            
           
            // rectangle for Income
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green )
                                .frame(width: 150, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )

                Text("Income")
                    .font(.body)
                    .foregroundColor(.black)
                
             
              .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
            }
            Spacer()

            
           
            
            // Rectangle for expense
            ZStack {
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red )
                                .frame(width: 150, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                Text("Expense")
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                
            }
        }
       .padding(.horizontal)
        
        Spacer()
        

            .frame(maxWidth: .infinity, maxHeight: .leastNonzeroMagnitude, alignment: .center)
                  .padding()
        
        
    }
}
//// Calculate total income
//   func calculateTotalIncome() -> Double {
//       if selectedTimeInterval == "Weekly" {
//           return week.reduce(0) { $0 + $1.income }
//       } else {
//           return month.reduce(0) { $0 + $1.income }
//       }
//   }
//   
//   // Calculate total expense
//   func calculateTotalExpense() -> Double {
//       if selectedTimeInterval == "Weekly" {
//           return week.reduce(0) { $0 + $1.expense }
//       } else {
//           return month.reduce(0) { $0 + $1.expense }
//       }
//   }


    
    struct GraphView_Previews: PreviewProvider {
        static var previews: some View {
            GraphView()
        }
    }

