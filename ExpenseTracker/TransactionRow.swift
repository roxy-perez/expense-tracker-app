//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 17/6/25.
//

import SwiftUI

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7, )
                    .lineLimit(1)
                
                Text(Date(), format: .dateTime.year().month().day())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
                   
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
    }
}
