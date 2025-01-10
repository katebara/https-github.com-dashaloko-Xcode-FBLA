//
//  DataPoint.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 1/3/25.
//

import Foundation

struct DataPoint: Identifiable {
    var id = UUID().uuidString
    var day: String
    var dollars: Double
    var type: String //Income or Expense
    
}
