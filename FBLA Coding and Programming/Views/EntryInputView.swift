//
//  EntryInputView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

struct EntryInputView: View {
    @StateObject var viewModel = EntryInputViewViewModel()
    @Binding var newItemPresented: Bool
    @Binding var totalBalance: Double // Binding to the total balance in `HomeView`
    @State private var selectedOption: String = "Income" // Track selected option (default: Income)
    
    var body: some View {
        VStack {
            // Title
            Text("Log Entry")
                .font(.system(size: 20))
                .bold()
                .padding(.top, 50)

            // Button Selection for Income/Expense
            HStack(spacing: 60) {
                // Income Button
                TLButton(
                    title: "Income",
                    background: selectedOption == "Income" ? Color("yellow") : Color("white")
                ) {
                    selectedOption = "Income"
                }
                
                // Expense Button
                TLButton(
                    title: "Expense",
                    background: selectedOption == "Expense" ? Color("yellow") : Color("white")
                ) {
                    selectedOption = "Expense"
                }
            }
            .padding()

            Form {
                // Description
                TextField("Description", text: $viewModel.description)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .tint(Color("yellow"))
                    .font(.system(size: 20))

                // Date
                DatePicker("Enter your date", selection: $viewModel.date, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(Color("yellow"))

                // Amount
                TextField("Amount", text: $viewModel.amount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .tint(Color("yellow"))
                    .font(.system(size: 20))

                // Save Button
                TLButton(
                    title: "Save",
                    background: Color("yellow")
                ) {
                    if viewModel.canSave {
                        updateBalance()
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .scrollContentBackground(.hidden)
            
            // Alert for invalid input
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .background(Color("white"))
    }

    // Update the total balance based on the selected option
    private func updateBalance() {
        guard let amount = Double(viewModel.amount.trimmingCharacters(in: .whitespaces)) else { return }
        
        // Update total balance based on selected option (Income or Expense)
        if selectedOption == "Income" {
            totalBalance += amount // Add to balance
        } else if selectedOption == "Expense" {
            totalBalance -= amount // Subtract from balance
        }

        print("Updated Balance: \(totalBalance)") // Debugging
    }
    
    func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        return "\(month)/\(day)/\(year)"
    }
}

struct EntryInputView_Previews: PreviewProvider {
    static var previews: some View {
        EntryInputView(
            newItemPresented: .constant(true),
            totalBalance: .constant(100.0) // Example starting balance
        )
        .previewLayout(.sizeThatFits)
    }
}
