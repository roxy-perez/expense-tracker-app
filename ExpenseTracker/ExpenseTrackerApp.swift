//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
