//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez on 18/6/25.
//

import Collections
import Combine
import Foundation

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class TransactionListViewModel: ObservableObject {
  @Published var transactions: [Transaction] = []

  private var cancellables: Set<AnyCancellable> = []

  init() {
    getTransactions()
  }

  func getTransactions() {
    guard
      let url = URL(
        string: "https://designcode.io/data/transactions.json"
      )
    else {
      print("Invalid URL")
      return
    }

    URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { (data, response) -> Data in
        guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode
        else {
          dump(response)
          throw URLError(.badServerResponse)
        }
        return data
      }
      .decode(type: [Transaction].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .sink(
        receiveCompletion: { completion in
          switch completion {
          case .failure(let error):
            print(
              "Error fetching transactions:",
              error.localizedDescription
            )
          case .finished:
            print("Finished fetching transactions")
          }
        },
        receiveValue: { [weak self] result in
          self?.transactions = result
          //dump(self?.transactions)
        }
      )
      .store(in: &cancellables)
  }

  func groupTransactionsByMonth() -> TransactionGroup {
    guard !transactions.isEmpty else {
      return [:]
    }
    let groupedTransactions = TransactionGroup(grouping: transactions) {
      $0.month
    }

    return groupedTransactions
  }

  func accumulateTransactions() -> TransactionPrefixSum {
    guard !transactions.isEmpty else {
      return []
    }

    let today = transactions.map(\.parsedDate).max() ?? Date()
    let dateInterval = Calendar.current.dateInterval(
      of: .month,
      for: today
    )!

    var sum: Double = .zero
    var cumulativeSum = TransactionPrefixSum()

    for date in stride(
      from: dateInterval.start,
      through: today,
      by: 60 * 60 * 24
    ) {
      let dailyExpenses = transactions.filter {
        Calendar.current.isDate($0.parsedDate, inSameDayAs: date)
          && $0.isExpense
      }
      let dailyTotal = dailyExpenses.reduce(0) {
        $0 - $1.signedAmount
      }

      sum += dailyTotal
      sum = sum.roundedToDigits()
      cumulativeSum.append((date.formatted(), sum))
      print(date.formatted(), "daily total:", dailyTotal, "sum:", sum)

    }
    return cumulativeSum

  }
}
