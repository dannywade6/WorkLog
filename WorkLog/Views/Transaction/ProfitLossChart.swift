//
//  ProfitLossChart.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI
import Charts

struct ProfitLossChart: View {
    let revenueData = [
        (revenueType: "Income", data: RevenueData.incomeAmount),
        (revenueType: "Expense", data: RevenueData.expenseAmount)
    ]
    
    var incomeGradient: LinearGradient {
        LinearGradient(colors: [Color("brand.blue.one"), Color("brand.blue.two")], startPoint: .leading, endPoint: .trailing)
    }
    
    var expenseGradient: LinearGradient {
        LinearGradient(colors: [Color("brand.gray.one"), Color("brand.gray.two")], startPoint: .leading, endPoint: .trailing)
    }
    
    var body: some View {
            VStack {
                Chart {
                    ForEach(revenueData, id: \.revenueType) { element in
                        ForEach(element.data) {
                            BarMark(
                                x: .value("Amount", $0.amount),
                                y: .value("Type", $0.incomeExpenseType.rawValue))
                        }
                        .foregroundStyle(by: .value("Type", element.revenueType))
                        .cornerRadius(5)
                    }
                    
                }
                .chartForegroundStyleScale(["Income": incomeGradient, "Expense": expenseGradient])
                .chartLegend(.hidden)
            }
            .padding()
        }
    }

struct ProfitLossChart_Previews: PreviewProvider {
    static var previews: some View {
        ProfitLossChart()
    }
}

struct RevenueData: Identifiable {
    let id = UUID()
    let incomeExpenseType: IncomeOrExpense
    let amount: Int
    
    enum IncomeOrExpense: String {
        case income = "Income"
        case expense = "Expense"
    }
}

extension RevenueData {
    static let incomeAmount: [RevenueData] = [
        .init(incomeExpenseType: .income, amount: 3200)
    ]
    
    static let expenseAmount: [RevenueData] = [
        .init(incomeExpenseType: .expense, amount: 1600)
    ]
}
