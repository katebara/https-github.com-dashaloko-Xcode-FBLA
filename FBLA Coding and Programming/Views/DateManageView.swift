//
//  DateManageView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

struct DateManageView: View {
    var body: some View {
        VStack{
            HStack{
                Text(getCurrentTime())
                
            }
        }
    }
    func getCurrentTime()->String{
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let theDate = "\(month)/\(day)/\(year)"
        return theDate
    }
}

#Preview {
    DateManageView()
}
