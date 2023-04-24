//
//  Transaction.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import Foundation

//enum TransactionType {
//    case income
//    case expense
//}

struct Transaction: Identifiable {
    var id = UUID()
    var description: String
    var origin: String
    var date: Date
    var amount: Double
//    var type: TransactionType
//    var type: TransactionViewModel.TransactionType
}




//    let amount: Double
//    let date: Date
//    let isExpense: Bool
//}
