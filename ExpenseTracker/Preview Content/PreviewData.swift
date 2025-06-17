//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 17/6/25.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "17/06/2025", institution: "Colegio San Pablo", account: "Visa Colegio San Pablo", merchant: "Apple Store", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
