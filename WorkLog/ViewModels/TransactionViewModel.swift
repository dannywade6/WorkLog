//
//  TransactionViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    var total: Double {
        let totalIncome = transactions.filter{ !$0.isExpense }.reduce(0) { $0 + $1.amount }
        let totalExpense = transactions.filter{ $0.isExpense }.reduce(0) { $0 + $1.amount }
        return totalIncome - totalExpense
    }
    
    func addTransaction(amount: Double, isExpense: Bool) {
        let transaction = Transaction(amount: amount, date: Date(), isExpense: isExpense)
        transactions.append(transaction)
    }
}
