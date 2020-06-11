//
//  ErrorMessage.swift
//  NotifyMe
//
//  Created by Praks on 6/11/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import Foundation
final class ErrorMessage: ObservableObject {
    var title: String = ""
    var message: String = ""
    
    var action: () -> Void = { }
    var actionTitle: String = ""
    var actionMessage: String = ""
    @Published var showAlert: Bool = false
}
