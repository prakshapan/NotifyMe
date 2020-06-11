//
//  AddButtonView.swift
//  NotifyMe
//
//  Created by Praks on 6/10/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI
struct AddButtonView: View {
    var title: String
    var didClick: () -> Void = { }
    @State var detectClick: Bool = true

    var body: some View {
        Text(title)
            .fontWeight(.medium)
            .font(Font.system(size: 28))
            .frame(height: 30, alignment: .center)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.darkGreen)
            .cornerRadius(30)
            .foregroundColor(.white)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.darkGreen, lineWidth: 1)
            )
            .scaleEffect(self.detectClick ? 0.98 : 1)
            .onTapGesture {
                self.detectClick.toggle()
                self.didClick()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.07) {
                    self.detectClick.toggle()
                }
            }
            .padding(8)
    }
}


struct AddButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.darkGreen)
            .cornerRadius(30)
            .foregroundColor(.white)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.darkGreen, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .padding(8)
    }
}
