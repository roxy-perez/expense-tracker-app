//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import Foundation
import SwiftUI

extension Color{
    static let appBackground = Color("Background")
    static let appIconColor = Color("Icon")
    static let appTextColor = Color("Text")
    static let appSystemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericEUR: DateFormatter = {
        print ("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericEUR.date(from: self) else {
            return Date()
        }
        return parsedDate
    }
}

