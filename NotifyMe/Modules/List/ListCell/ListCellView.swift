//
//  ListCellView.swift
//  NotifyMe
//
//  Created by Praks on 6/8/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI

struct ListCellView: View {
    var message = NotifyMessage()
       var type: DateFilter = .future
    var onDeleteTap: () -> Void = { }
 

    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text(message.title ?? "")
                    .font(.custom("SF Pro Rounded", size: 20))
                    .bold().foregroundColor(.offWhite)
                    .padding(.bottom, 4)
                Text(message.detail ?? "")
                    .font(.custom("SF Mono", size: 16))
                    .foregroundColor(.secondaryWhite)
                HStack(spacing: 0) {
                    Text("Will be notified: ")
                        .foregroundColor(.leafGreen)
                    Text(Calendar.current.isDateInToday(message.date!) ? "Today" : "\(message.date!, formatter: AppDateFormat.dateFullMonthFormatter)")
                        .foregroundColor(.secondaryWhite)
                }.font(.custom("SF Mono", size: 16))
                HStack(spacing: 0) {
                    Text("At: ")
                        .foregroundColor(.leafGreen)
                    Text("\(message.date!, formatter: AppDateFormat.timeFormatter)")
                        .foregroundColor(.secondaryWhite)
                }.font(.custom("SF Mono", size: 16))
            }.padding()
            Spacer()

            Text("Delete")
                .frame(width: 60, height: 40, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.darkGreen)
                )
                .padding()
                .onTapGesture {
                    self.onDeleteTap()
            }
        }
            .frame(minWidth: 340, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(self.type == .future ? Color.future : .darkEnd)
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
            )
            .padding(12)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(message: NotifyMessage())
    }
}
