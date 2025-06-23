//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 22/6/25.
//

import SwiftUI

struct TransactionList: View {
  @EnvironmentObject var transactionListVM: TransactionListViewModel

  var body: some View {
    VStack {
      List {
        ForEach(Array(transactionListVM.groupTransactionsByMonth()), id: \.key) {
          month, transactions in
          Section {
            ForEach(transactions) { transaction in
              TransactionRow(transaction: transaction)
            }
          } header: {
            Text(month)
          }
          .listSectionSeparator(.hidden)
        }
      }
      .listStyle(.plain)
    }
    .navigationTitle("Transacciones")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct TransactionList_Previews: PreviewProvider {
  static let transactionListVM: TransactionListViewModel = {
    let transactionListVM = TransactionListViewModel()
    transactionListVM.transactions = transactionListPreviewData
    return transactionListVM
  }()
  static var previews: some View {
    Group {
      NavigationView {
        TransactionList()
          .preferredColorScheme(.light)
      }
      NavigationView {
        TransactionList()
          .preferredColorScheme(.dark)
      }
    }
    .environmentObject(transactionListVM)
  }
}
