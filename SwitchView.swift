//
//  SwitchView.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/3/25.
//



import SwiftUI
struct SwitchView: View{
    enum SwitchView: String, CaseIterable, Identifiable{
        case history = "History"
        case statistics = "Statistics"
        
        var id: Self { return self }
    }
    
    @State private var selectedSwitchView = SwitchView.history
    
    var body: some View{
        VStack{
            
            Picker(selection: $selectedSwitchView) {
                ForEach(SwitchView.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label:{
                Text("Switch view")
                
            }
            .pickerStyle(.segmented)
            .padding(.top, 59)
            switch selectedSwitchView {
            case .history:
                VStack {
                                  GraphView()
                                  Spacer() 
                              }
                              
                
                
                
                
                
                
                
            case .statistics:
                    
                VStack( ){
                   
                    GraphView()
                    
                    //TimeIntervalView in a rectangle
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(height: 250)
                            .overlay(TimeIntervalView().padding())
                    }
                    .padding()
                    
                    // PieChartView in a rectangle
                    VStack (){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(height: 270)
                            .overlay(PieChartView().padding())
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.3))
                .ignoresSafeArea()
            }
        }
    }

    
    
    
    
}
