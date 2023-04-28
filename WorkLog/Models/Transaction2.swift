//
//  Transaction2.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

//enum TransactionType: Equatable {
//    case income
//    case expense
//}

struct Transaction2: Identifiable {
    let id = UUID()
    var description: String
    var origin: String
    var date: Date
    var amount: Double
//    var transactionType: TransactionType
    var isExpense: Bool
}
