//
//  ContentView.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 1/9/25.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        VStack{
            LemonView()
        }
    }
    
    func test(){
        print(URL.documentsDirectory)
    }
}

#Preview {
    ContentView1()
}
