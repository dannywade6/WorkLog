//
//  Transaction2.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    var description: String
    var origin: String
    var date: Date
    var amount: Double
    var isExpense: Bool
    var formattedCurrency: String?
}
