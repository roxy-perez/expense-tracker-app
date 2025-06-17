//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import Foundation

struct Transaction: Identifiable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryId: Int
    let category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    let isEdited: Bool
}

enum TransactionType: String {
    case credit = "credit"
    case debit = "debit"
}
