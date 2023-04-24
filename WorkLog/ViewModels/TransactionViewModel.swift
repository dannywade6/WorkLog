//
//  TransactionViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI
import Combine

class TransactionViewModel: ObservableObject {
    
    // Input
    @Published var transactionDescription: String = ""
    @Published var transactionOrigin: String = ""
    @Published var transactionDate: Date = Date()
    @Published var transactionAmount: Double = 0.0
    
    // Output
//    @Published var transactionType: TransactionType?
    @Published var transactions: [Transaction] = []
        
        // Enum for transaction type
//    enum TransactionType {
//            case income
//            case expense
//        }
        
        // Functions to handle button presses
//        func logIncome() {
//            transactionType = .income
//        }
//        
//        func logExpense() {
//            transactionType = .expense
//        }
        
        // Function to save the transaction
        func saveTransaction() {
            let transaction = Transaction(description: transactionDescription,
                                          origin: transactionOrigin,
                                          date: transactionDate,
                                          amount: transactionAmount)
//                                          type: transactionType ?? TransactionViewModel.TransactionType.expense)
            transactions.append(transaction)
    }
}

//    @Published var transactions: [Transaction] = []
//
//    var total: Double {
//        let totalIncome = transactions.filter{ !$0.isExpense }.reduce(0) { $0 + $1.amount }
//        let totalExpense = transactions.filter{ $0.isExpense }.reduce(0) { $0 + $1.amount }
//        return totalIncome - totalExpense
//    }
//
//    func addTransaction(amount: Double, isExpense: Bool) {
//        let transaction = Transaction(amount: amount, date: Date(), isExpense: isExpense)
//        transactions.append(transaction)
//    }
//}
