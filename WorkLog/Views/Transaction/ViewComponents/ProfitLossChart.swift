//
//  ProfitLossChart.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI
import Charts

struct ProfitLossChart: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    
    
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
            HStack(alignment: .bottom) {
                // Profit Info
                VStack(alignment: .leading, spacing: -5) {
                    Text("\(viewModel.totalProfitOrLoss() < 0 ? "Total Loss" : "Total Profit")")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.leading)
                        .padding(.bottom, 5)
                    HStack {
                        Text("\(viewModel.formatCurrency(viewModel.totalProfitOrLoss()))")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Menu(content: {
                            // Menu
                        }, label: {
                            HStack {
                                Image(systemName: "calendar")
                                Text("Last 7 Days")
                            }
                            .foregroundColor(Color("brand.blue.one"))
                        })
                        .padding(.trailing)
                    }
                }
            }
            
            VStack {
                // Chart Info
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
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct ProfitLossChart_Previews: PreviewProvider {
    static var previews: some View {
        ProfitLossChart()
            .environmentObject(TransactionViewModel())
    }
}

struct RevenueData: Identifiable {
    let id = UUID()
    let incomeExpenseType: IncomeOrExpense
    let amount: Double
    
    enum IncomeOrExpense: String {
        case income = "Income"
        case expense = "Expense"
    }
}

extension RevenueData {
    static let incomeAmount: [RevenueData] = [
        .init(incomeExpenseType: .income, amount: 900.22)
    ]
    
    static let expenseAmount: [RevenueData] = [
        .init(incomeExpenseType: .expense, amount: 200.44)
    ]
}


