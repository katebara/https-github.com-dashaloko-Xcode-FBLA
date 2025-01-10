//
//  SwitchView.swift
//  MoneyTracker
//
//  Created by Valerii Koreniev on 1/3/25.
//



import SwiftUI

struct SwitchView_: View {
    enum SwitchView: String, CaseIterable, Identifiable {
        case history = "History"
        case statistics = "Statistics"
        
        var id: Self { return self }
    }
    
    @StateObject var viewModel = EntryInputViewViewModel()
    @State private var selectedSwitchView = SwitchView.history
    
    var body: some View {
        VStack {
            // Picker to switch views
            Picker(selection: $selectedSwitchView) {
                ForEach(SwitchView.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Switch view")
            }
            .pickerStyle(.segmented)
            .padding(.top, 59)
            
            switch selectedSwitchView {
            case .history:
                VStack {
                    // Display entries with delete functionality
                    List {
                        ForEach(viewModel.entries) { entry in
                            VStack(alignment: .leading) {
                                Text(entry.description)
                                    .font(.headline)
                                Text("Date: \(entry.date.formatted(date: .abbreviated, time: .omitted))")
                                    .font(.subheadline)
                                Text("Amount: $\(entry.amount, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                            .padding()
                            .background(Color("white"))
                            .cornerRadius(8)
                        }
                        .onDelete(perform: deleteItem) // Attach delete functionality here
                    }
                    .listStyle(InsetGroupedListStyle()) // Apply a clean list style
                    .navigationBarTitle("Entries", displayMode: .inline)
                    .navigationBarItems(trailing: EditButton())
                }
                
            case .statistics:
                ScrollView {
                    VStack {
                        // TimeIntervalView in a rectangle
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
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(height: 270)
                                .overlay(PieChartView_().padding())
                        }
                        .padding()
                    }
                    .background(Color.gray.opacity(0.3))
                    .ignoresSafeArea()
                }
            }
        }
    }
    
    // Function to delete entries
    private func deleteItem(at offsets: IndexSet) {
        viewModel.entries.remove(atOffsets: offsets)
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        // Providing mock data for the view model
        let mockViewModel = EntryInputViewViewModel()
        mockViewModel.entries = [
            Entry(description: "Groceries", date: Date(), amount: 50.0),
            Entry(description: "Salary", date: Date(), amount: 1500.0),
            Entry(description: "Electricity Bill", date: Date(), amount: -75.0)
        ]
        
        return SwitchView_()
            .environmentObject(mockViewModel) // Inject mock data
            .previewLayout(.sizeThatFits)
    }
}
