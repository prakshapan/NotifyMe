//
//  DateFilterListView.swift
//  NotifyMe
//
//  Created by Praks on 6/10/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI
import CoreData

struct DateFilterListView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject private var errorMessage = ErrorMessage()
    private var fetchRequest: FetchRequest<NotifyMessage>
    private var messages: FetchedResults<NotifyMessage> {
        fetchRequest.wrappedValue
    }

    private var filterType: DateFilter = .future

    init(filter: String) {
        fetchRequest = FetchRequest<NotifyMessage>(entity: NotifyMessage.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \NotifyMessage.date, ascending: true)], predicate: NSPredicate(format: "\(filter) %@", Date() as CVarArg))
        self.filterType = DateFilter(rawValue: filter)!
    }

    var body: some View {
        VStack() {
            appBanner
            ScrollView() {
                ForEach(messages, id: \.id) { notifyMessage in
                    ListCellView(message: notifyMessage,
                        type: self.filterType,
                        onDeleteTap: {
                            print("Delete")
                            self.moc.delete(notifyMessage)
                            try? self.moc.save()
                        })
                }
            }
        }.alert(isPresented: self.$errorMessage.showAlert) {
            Alert(title: Text(errorMessage.title),
                message: Text(errorMessage.message),
                primaryButton: .default(Text("No")),
                secondaryButton: .default(Text(errorMessage.actionTitle), action: {
                        self.errorMessage.action()
                    }))
        }
    }

    private var appBanner: some View {
        HStack() {
            appTitle
            Spacer()
            Button(action: {
                self.confirmDeletion()
            }) {
                Text("􀈑")
                    .font(.system(size: 24))
                    .padding(8)
                    .frame(width: 50, height: 50)
                    .background(Color.darkGreen)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }.buttonStyle(PlainButtonStyle())
        }.padding(.horizontal, 16)
    }

    private var appTitle: some View {
        HStack() {
            Text("Notify Me")
                .font(.custom("SF Pro Rounded", size: 40))
                .fontWeight(.medium)
                .padding()
            Spacer()
        }
    }

    private func deleteAll() {
        for notifyMessage in self.messages {
            self.moc.delete(notifyMessage)
        }
        try? self.moc.save()
    }

    private func confirmDeletion() {
        self.errorMessage.title = "Delete All"
        self.errorMessage.message = "This will delete all the records in the current selection. Are you sure you want to do that?"
        self.errorMessage.actionTitle = "Yes, I am."
        self.errorMessage.action = {
            self.deleteAll()
        }
        self.errorMessage.showAlert = true
    }


}


