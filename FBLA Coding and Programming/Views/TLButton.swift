//
//  TLButton.swift
//  FBLA Coding and Programming
//
//  Created by imac-kate on 12/30/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    @State private var isPressed = false

        var body: some View {
            Button(action: {
                isPressed = true
                action()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .foregroundColor(background)
                        .opacity(isPressed ? 0.4 : 1) // Change opacity when pressed
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.black, lineWidth: 2)
                        )

                    Text(title)
                        .foregroundColor(Color.black)
                        .bold()
                }
            }
            .frame(width: 110, height: 35)
            .onChange(of: isPressed) { _, newValue in
                if newValue {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        isPressed = false // Reset pressed state after a short delay
                    }
                }
        }
    }
}


struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(
            title: "Value",
            background: Color("yellow"),
            action: { print("Button pressed") }
        )
        .previewLayout(.sizeThatFits)
    }
}
