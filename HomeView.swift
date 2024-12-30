//
//  HomeView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var balance = 0
    
    var body: some View {
        VStack {
            // Header
            ZStack {
                // Rounded rectangle background with stroke and fill
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color("yellow"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 3)
                    )

                // Header content
                HStack(spacing: 20) {
                    // Current balance
                    VStack {
                        Text("Current Balance")
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        // Add the balance amount here
                        Text("$0.00") // Placeholder for balance
                            .font(.title)
                            .bold()
                    }

                    Spacer()

                    // Add entry button
                    VStack {
                        Text("Add Entry")
                            .font(.headline)
                            .foregroundColor(.black)

                        NavigationLink(destination: EntryInputView()) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                    .frame(width: 50)

                                Image(systemName: "plus") // Add a plus icon
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.horizontal, 50)
            }
            .frame(width: UIScreen.main.bounds.width / 1.1, height: 150)
            .offset(y: 20)

            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
