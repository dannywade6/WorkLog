//
//  Transaction2ViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

class Transaction2ViewModel: ObservableObject {
    @Published var transaction2 = [Transaction2]()
    
    func addTransaction2(description: String, origin: String, date: Date, amount: Double, isExpense: Bool) {
        let newTransaction = Transaction2(description: description, origin: origin, date: date, amount: amount, isExpense: isExpense)
        transaction2.append(newTransaction)
    }
}
