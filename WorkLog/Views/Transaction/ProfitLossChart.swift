//
//  ProfitLossChart.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI
import Charts

// 1. Data model
struct Revenue: Identifiable {
    let id = UUID()
    let revenueType: ProfitLossType
    let amount: Double
    
    enum ProfitLossType: String, Equatable {
        case income = "Income"
        case expense = "Expense"
    }
}

// 2. Actual revenue data
let revenueData: [Revenue] = [
    Revenue(revenueType: .income, amount: 53711.30),
    Revenue(revenueType: .expense, amount: 20812.50)
]

struct ProfitLossChart: View {
    
    var incomeGradient: LinearGradient {
        LinearGradient(colors: [Color("brand.blue.one"), Color("brand.blue.two")], startPoint: .leading, endPoint: .trailing)
    }
    
    var expenseGradient: LinearGradient {
        LinearGradient(colors: [Color("brand.gray.one"), Color("brand.gray.two")], startPoint: .leading, endPoint: .trailing)
    }

    
    var body: some View {
        VStack {
            Chart(revenueData) { item in
                BarMark(
                    x: .value("Amount", item.amount),
                    y: .value("Revenue Type", item.revenueType.rawValue)
                )
                
                // 1. Add annotations
                .annotation(position: .trailing) {
                    Text(String(format: "£%.0f", item.amount))
                        .foregroundColor(Color.gray)
                        .font(.system(size: 12, weight: .bold))
                        .padding()
                }
                
//                .foregroundStyle(.linearGradient(
//                    colors: [barColor1, barColor2],
//                    startPoint: .leading,
//                    endPoint: .trailing))
                .cornerRadius(10)
            }
//            .chartForegroundStyleScale(["Income": incomeGradient, "Expense": expenseGradient])
            .chartXAxis(.hidden)
            
        }
        .padding()
        
    }
}

struct ProfitLossChart_Previews: PreviewProvider {
    static var previews: some View {
        ProfitLossChart()
    }
}


