//
//  Transaction2ViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transaction = [Transaction]()
    
    func addTransaction2(description: String, origin: String, date: Date, amount: Double, isExpense: Bool, formattedCurrency: String?) {
        let newTransaction = Transaction(description: description, origin: origin, date: date, amount: amount, isExpense: isExpense, formattedCurrency: formattedCurrency)
        transaction.append(newTransaction)
    }
}
