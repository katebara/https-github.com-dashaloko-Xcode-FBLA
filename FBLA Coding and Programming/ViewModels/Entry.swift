//
//  Entry.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 1/7/25.
//

import Foundation

struct Entry: Codable, Identifiable {
    let id: UUID
    let description: String
    let date: Date
    let amount: Double

    init(description: String, date: Date, amount: Double) {
        self.id = UUID() // Unique identifier for each entry
        self.description = description
        self.date = date
        self.amount = amount
    }
}

