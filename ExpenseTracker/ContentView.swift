//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    //@EnvironmentObject var transactionListVM: TransactionListViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Resumen")
                        .font(.title2)
                        .bold()

                    //MARK: Chart
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(
                                    totalExpenses.formatted(
                                        .currency(code: "EUR")
                                    ),
                                    type: .title, format: "$%.02f"
                                )
                                LineChart()
                                    .padding(.horizontal)
                            }
                            .background(Color.appSystemBackground)
                        }
                        .data(data)
                        .chartStyle(
                            ChartStyle(
                                backgroundColor: Color.icon.opacity(0.4),
                                foregroundColor: ColorGradient(
                                    Color.accentColor.opacity(0.8),
                                    Color.accentColor
                                )
                            )
                        )
                        .frame(height: 300)

                    }

                    // MARK: Transaction Listˆ
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color.appBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.accentColor, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()

    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
