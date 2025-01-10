//
//  HomeView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = EntryInputViewViewModel()
    @State var balance: Double = 0.0

    var body: some View {
        NavigationView {
            VStack {
                
                LemonView()
                    
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
                    .offset(y:-200)
                    
                    SwitchView_()
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 1.4 )
                        .offset(y:-200)
                    
                    
                    
                }
                .background(Color("white"))
                
                .listStyle(PlainListStyle())

                Spacer()
            }
            .background(Color("white"))
            .onAppear {
                viewModel.loadEntries()
                calculateBalance()
            }
        }
        
    }

    // Calculate the total balance from entries
    private func calculateBalance() {
        balance = viewModel.entries.reduce(0) { $0 + $1.amount }
        print("Current Balance: \(balance)") // Print updated balance
        print("Entries: \(viewModel.entries)") // Print entries to debug
    }
    
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
