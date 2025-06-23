//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 22/6/25.
//

import SwiftUI

struct RecentTransactionList: View {
  @EnvironmentObject var transactionListVM: TransactionListViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Text("Transacciones Recientes")
          .bold()
         Spacer()

        NavigationLink {
            TransactionList()
        } label: {
          HStack(spacing: 4) {
            Text("Ver más")
            Image(systemName: "chevron.right")
          }
          .foregroundColor(Color.accentColor)
        }
      }
      .padding()

      //MARK:  Recent Transactions List
      ForEach(
        Array(transactionListVM.transactions.prefix(5).enumerated()),
        id: \.element
      ) { index, transaction in
        TransactionRow(transaction: transaction)

        Divider().opacity(index == 4 ? 0 : 1)
      }
    }
    .padding(.horizontal)
    .background(Color.appSystemBackground)
    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    .shadow(color: Color.primary.opacity(0.24), radius: 4, x: 4, y: 4)
  }
}

struct RecentTransactionList_Previews: PreviewProvider {
  static let transactionListVM: TransactionListViewModel = {
    let transactionListVM = TransactionListViewModel()
    transactionListVM.transactions = transactionListPreviewData
    return transactionListVM
  }()
  static var previews: some View {
    Group {
      RecentTransactionList()
        .preferredColorScheme(.light)
      RecentTransactionList()
        .preferredColorScheme(.dark)
    }
    .environmentObject(transactionListVM)
  }
}
