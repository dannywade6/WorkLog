//
//  AddTransaction2View.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import SwiftUI

struct AddIncomeView: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    
    @State private var incomeDescription = ""
    @State private var incomeOrigin = ""
    @State private var incomeDate = Date()
    @State private var incomeAmountText = ""
    @State private var incomeAmount: Double = 0.00
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Income Description")) {
                    TextField("Description", text: $incomeDescription)
                }
                Section(header: Text("Income Origin")) {
                    TextField("Source of Income", text: $incomeOrigin)
                }
                Section(header: Text("Date of Payment")) {
                    HStack {
                        DatePicker("Date of Payment", selection: $incomeDate, displayedComponents: .date)
                            .foregroundColor(.gray)
                    }
                }
                Section(header: Text("Income Amount")) {
                    TextField("Income Amount", text: $incomeAmountText)
                        .onChange(of: incomeAmountText) { newValue in
                            incomeAmount = numberFormatter.number(from: newValue)?.doubleValue ?? 0.0
                        }
                        .keyboardType(.decimalPad)
                }
                
                Button {
                    viewModel.addTransaction2(description: incomeDescription, origin: incomeOrigin, date: incomeDate, amount: incomeAmount, isExpense: false, formattedCurrency: formatCurrency(incomeAmount))
                    resetFields()
                } label: {
                    Text("Add Income")
                }
                
            }
            .navigationTitle("Add Income")
        }
    }
    
    func formatCurrency(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "GBP"
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "£0.00"
    }
    
    
    func resetFields() {
        incomeDescription = ""
        incomeOrigin = ""
        incomeDate = Date()
        incomeAmountText = ""
        incomeAmount = 0.00
    }
}

struct AddTransaction2View_Previews: PreviewProvider {
    static var previews: some View {
        AddIncomeView()
            .environmentObject(TransactionViewModel())
    }
}
