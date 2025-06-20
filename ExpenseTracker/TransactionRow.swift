//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 17/6/25.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.7))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: .icons),
                                  fontsize: 24, color: Color.icon)
                }
            
                    VStack(alignment: .leading, spacing: 6) {
                        Text(transaction.merchant)
                            .font(.subheadline)
                            .bold()
                            .lineLimit(1)
                        
                        Text(transaction.category)
                            .font(.footnote)
                            .opacity(0.7, )
                            .lineLimit(1)
                        
                        Text(transaction.dateParsed, format: .dateTime.year().month().day())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text(transaction.signedAmount, format: .currency(code: "EUR"))
                        .bold()
                        .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
                }
                .padding([.top, .bottom], 8)
        }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
    }
}
