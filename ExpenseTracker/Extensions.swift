//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import Foundation
import SwiftUI

extension Color {
  static let appBackground = Color("Background")
  static let appIconColor = Color("Icon")
  static let appTextColor = Color("Text")
  static let appSystemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
  // MARK: - Date Formatters in spanish
  static let allNumericEUR: DateFormatter = {
    let formatter = DateFormatter()
    formatter.calendar = Calendar(identifier: .gregorian)
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    formatter.dateFormat = "MM/dd/yyyy"

    return formatter
  }()
}

extension String {
  func dateParsed() -> Date {
    guard let parsedDate = DateFormatter.allNumericEUR.date(from: self) else {
      return Date()
    }
    return parsedDate
  }
}

extension Date {
  func formatted() -> String {
    return self.formatted(.dateTime.year().month().day())
  }
}

extension Double {
  func roundedToDigits() -> Double {
    return (self * 100).rounded() / 100
  }
}
