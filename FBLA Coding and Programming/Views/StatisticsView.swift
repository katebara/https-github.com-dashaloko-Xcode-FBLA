//
//  StatisticsView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 1/9/25.
//

import SwiftUI

struct StatisticsView: View {
    @StateObject var viewModel = EntryInputViewViewModel()
    @State var balance: Double = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                LemonView()
                    .offset(y:200)
                VStack {
                    // Header
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color("yellow"))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            
                            HStack(spacing: 40) {
                                // Current balance
                                VStack {
                                    Text("Current Balance")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    // Display the balance
                                    Text("$\(balance, specifier: "%.2f")")
                                        .font(.title)
                                        .bold()
                                }
                                
                                // Add entry button
                                VStack {
                                    Text("Add Entry")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Button {
                                        viewModel.showingEntryInputView = true
                                    } label: {
                                        ZStack {
                                            Circle()
                                                .fill(Color("white"))
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.black, lineWidth: 2)
                                                )
                                                .frame(width: 50)
                                            
                                            Image("plus")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20, height: 20)
                                        }
                                    }
                                }
                                .sheet(isPresented: $viewModel.showingEntryInputView) {
                                    EntryInputView(
                                        newItemPresented: $viewModel.showingEntryInputView,
                                        totalBalance: $balance
                                    )
                                }
                            }
                        }
                        
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: 150)
                    }
                    .offset(y:-400)
                    ScrollView{
                        VStack( ){
                            
                            
                            VStack( ){
                                //TimeIntervalView in a rectangle
                                VStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white)
                                        .frame(height: 250)
                                        .overlay(
                                            TimeIntervalView_(viewModel: EntryInputViewViewModel()).padding()
                                        )
                                }
                                .padding()
                                
                                // PieChartView in a rectangle
                                VStack (){
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white)
                                        .frame(height: 270)
                                        .overlay(PieChartView_().padding())
                                }
                                .padding()
                            }
                            .background(Color("white"))
                            .ignoresSafeArea()
                            
                        }
                        .background(Color("white"))
                        .ignoresSafeArea()
                        .offset(y:-600)
                    }
                }
            }
        }
    }
        
}
struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
    

