//
//  NSTextfieldExtensions.swift
//  Notifier
//
//  Created by Praks on 6/6/20.
//  Copyright © 2020 Praks. All rights reserved.
//

import SwiftUI
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
