//
//  ContentView.swift
//  ButtonBug
//
//  Created by Danylova, Diana on 01.06.2022.
//

import SwiftUI
import FioriSwiftUICore

struct ContentView: View {
    @State var indicator = false
    var body: some View {
        VStack{
            
            ScrollView(.vertical) {
                Spacer()
                FioriButton(
                  isSelectionPersistent: false
                ) { _ in
                    indicator.toggle()
                } label: { _ in
                    Text("TEXT")
                        .frame(maxWidth: .infinity)
                }
                .fioriButtonStyle(TaskInteractionButtonStyle(foregroundColor: .green))
                Spacer()
        }
        }
        .background(indicator ? .green : .red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TaskInteractionButtonStyle: FioriButtonStyle {
    let foregroundColor: Color
    let cornerRadius: CGFloat = 10

    @ViewBuilder
    func makeBody(configuration: FioriButtonStyle.Configuration) -> some View {
        let isPressed = configuration.state == .highlighted
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .foregroundColor(foregroundColor)
            .font(.fiori(forTextStyle: .body))
            .background(Color.preferredColor(.primaryFill))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 1)
                    .foregroundColor(foregroundColor)
            )
            .opacity(isPressed ? 0.4 : 1)
    }
}
