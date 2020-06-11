//
//  ContentView.swift
//  NotifyMe
//
//  Created by Praks on 6/8/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI
enum DateFilter: String {
    case future = "date >"
    case past = "date <"
}

struct ListNotificationView: View {
    @Environment(\.managedObjectContext) var moc
    @State var dateFilter = DateFilter.future
    var body: some View {
        NavigationView {
            VStack() {
                DateFilterListView(filter: dateFilter.rawValue)
                buttomBarView
            }.background(Color.normalDark)
                .frame(minWidth: 380)

            AddNotificationView(didSaveNotifier: { message in
                let notifyMessage = NotifyMessage(context: self.moc)
                notifyMessage.id = UUID()
                notifyMessage.title = message.title
                notifyMessage.detail = message.detail
                notifyMessage.date = message.date
                try? self.moc.save()
            }).padding()
                .frame(minWidth: 500)
        }.frame(minWidth: 850, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

// MARK: Sub-Views
extension ListNotificationView {
    fileprivate var buttomBarView: some View {
        HStack() {
            ListButtonView(title: "􀐫") {
                self.dateFilter = .future
            }
            ListButtonView(title: "􀆅") {
                self.dateFilter = .past
            }
        }.padding(20)
            .frame(height: 60)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color.secondaryBlack)
    }
}

struct ListNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ListNotificationView()
    }
}
