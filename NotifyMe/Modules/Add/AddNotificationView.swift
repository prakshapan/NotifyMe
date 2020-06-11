//
//  AddNotificationView.swift
//  NotifyMe
//
//  Created by Praks on 6/8/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI

struct AddNotificationView: View {
    @ObservedObject var message = Message(title: "")
    @ObservedObject private var errorMessage = ErrorMessage()

    var didSaveNotifier: (Message) -> ()

    var body: some View {
        VStack() {
            makeTextfield(with: "Title", binding: $message.title)
            makeTextfield(with: "Details", binding: $message.detail)
            DatePicker(selection: $message.date) {
                VStack(alignment: .leading) {
                    Text("Notify :").font(.subheadline)
                    Text("\(message.date, formatter: AppDateFormat.dateFormatter)    ")
                        .font(.title)
                        .fontWeight(.medium)
                    Text("\(message.date, formatter: AppDateFormat.timeFormatter)    ")
                        .font(.title)
                        .fontWeight(.medium)
                }
            }.datePickerStyle(GraphicalDatePickerStyle())
            Spacer(minLength: 40)
            saveButton
        }.alert(isPresented: self.$errorMessage.showAlert) {
            Alert(title: Text(errorMessage.title),
                message: Text(errorMessage.message),
                dismissButton: .default(Text("Ok")))
        }
    }

    var saveButton: some View {
        Button(action: {
            guard !self.message.title.isEmpty else {
                self.errorMessage.title = "Missing Title"
                self.errorMessage.message = "Please enter title."
                self.errorMessage.showAlert = true
                return
            }

            guard self.message.date > Date() else {
                self.errorMessage.title = "Future Date"
                self.errorMessage.message = "Please enter upcoming date/time."
                self.errorMessage.showAlert = true
                return
            }

            self.didSaveNotifier(self.message)
        }) {
            Text("Save")
                .fontWeight(.medium)
                .font(Font.system(size: 28))
                .frame(height: 30)
                .frame(maxWidth: .infinity, idealHeight: 40, alignment: .center)
        }.buttonStyle(AddButtonStyle())
    }

    func makeTextfield(with title: String, binding: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 10) {
                Text("\(title) :").font(.subheadline)
                TextField("", text: binding)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.all, 8)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            }.font(.system(size: 20))
                .frame(height: 50)
        }
    }

    func showNotification(with message: Message) {
        let notification = NSUserNotification()
        notification.title = message.title
        notification.subtitle = message.detail
        notification.deliveryDate = message.date
        notification.contentImage = NSImage(named: "bell")

        NSUserNotificationCenter.default.scheduleNotification(notification)
        // NSUserNotificationCenter.default.deliver(notification)
    }
}


struct AddNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AddNotificationView(didSaveNotifier: { _ in })
    }
}
