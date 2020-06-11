//
//  AppButton.swift
//  NotifyMe
//
//  Created by Praks on 6/11/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI
struct ListButtonView: View {
    var title: String
    var didClick: () -> Void = { }

    var body: some View {
        Button(action: {
            self.didClick()
        }) { Text(title).font(.system(size: 35))
        }.buttonStyle(ListButtonStyle())
    }
}

struct ListButtonStyle: ButtonStyle {
    var backgroundColor: Color = .clear
    var foregroundColor: Color = .darkGreen
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(foregroundColor)
            .font(.system(size: 35))
            .frame(width: 50, height: 50, alignment: .center)
            .padding(.vertical, 8)
            .blur(radius: configuration.isPressed ? 2 : 0)
    }
}


