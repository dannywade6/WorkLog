//
//  Transaction2.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

enum TransactionType: Identifiable, CaseIterable {
    var id: Self { self }
    case income
    case expense
}

struct Transaction2: Identifiable {
    let id = UUID()
    var description: String
    var origin: String
    var date: Date
    var amount: Double
    var transactionType: TransactionType
}






//enum TransactionType {
//    case income
//    case expense
//}

//struct Transaction: Identifiable {
//    var id = UUID()
//    var description: String
//    var origin: String
//    var date: Date
//    var amount: Double
//    var type: TransactionType
//    var type: TransactionViewModel.TransactionType
//}




//    let amount: Double
//    let date: Date
//    let isExpense: Bool
//}
