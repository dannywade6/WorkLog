//
//  TransactionViewModel.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import Foundation

class TransactionViewModel: ObservableObject {
    @Published var transaction = [Transaction]()
    
    func formatCurrency(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "GBP"
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "£0.00"
    }
        
    // Methods to calculate income, expense and P/L
    
    func totalExpenseAmount() -> Double {
        return transaction.filter { $0.isExpense }.reduce(0) { $0 + $1.amount }
    }
    
    func totalIncomeAmount() -> Double {
        return transaction.filter { !$0.isExpense }.reduce(0) { $0 + $1.amount }
    }
    
    func totalProfitOrLoss() -> Double {
        return totalIncomeAmount() - totalExpenseAmount()
    }
    
//    
//    func calculateProfitAndLossChartData() -> [BarChartDataPoint] {
//        let income = transaction.filter { !$0.isExpense }.reduce(0) { $0 + $1.amount }
//        let expenses = transaction.filter { $0.isExpense }.reduce(0) { $0 + $1.amount }
//        let profit = income - expenses
//        
//        let incomeDataPoint = BarChartDataPoint(value: income)
//        let expenseDataPoint = BarChartDataPoint(value: expenses)
//        let profitDataPoint = BarChartDataPoint(value: profit)
//        
//        return [incomeDataPoint, expenseDataPoint, profitDataPoint]
//    }
    
    
    
    
    func addTransaction(description: String, origin: String, date: Date, amount: Double, isExpense: Bool, formattedCurrency: String?) {
        let newTransaction = Transaction(description: description, origin: origin, date: date, amount: amount, isExpense: isExpense, formattedCurrency: formattedCurrency)
        transaction.append(newTransaction)
    }
}
