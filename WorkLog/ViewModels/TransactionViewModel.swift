//
//  Transaction2ViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transaction = [Transaction]()
    
    func addTransaction2(description: String, origin: String, date: Date, amount: Double, isExpense: Bool) {
        let newTransaction = Transaction(description: description, origin: origin, date: date, amount: amount, isExpense: isExpense)
        transaction.append(newTransaction)
    }
}
