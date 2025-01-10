//
//  EntryView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI
import UIKit



struct EntriesView: View {
    @StateObject var viewModel = EntriesViewViewModel()
    
    init() {
        
        
    }
    
    var body: some View {
        VStack {
            HomeView()
            
        }
    }
}


#Preview {
    EntriesView()
}
