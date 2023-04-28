//
//  AddExpenseView.swift
//  WorkLog
//
//  Created by Danny Wade on 28/04/2023.
//

import SwiftUI

struct AddExpenseView: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    
    @State private var expenseDescription = ""
    @State private var expenseOrigin = ""
    @State private var expenseDate = Date()
    @State private var expenseAmountText = ""
    @State private var expenseAmount: Double = 0.0
    
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
                Section(header: Text("Expense Description")) {
                    TextField("Description", text: $expenseDescription)
                }
                Section(header: Text("Expense Origin")) {
                    TextField("Recipient of Expense", text: $expenseOrigin)
                }
                Section(header: Text("Date of Payment")) {
                    HStack {
                        DatePicker("Date of Payment", selection: $expenseDate, displayedComponents: .date)
                            .foregroundColor(.gray)
                    }
                }
                Section(header: Text("Expense Amount")) {
                    TextField("Expense Amount", text: $expenseAmountText)
                        .onChange(of: expenseAmountText) { newValue in
                            expenseAmount = numberFormatter.number(from: newValue)?.doubleValue ?? 0.0
                        }
                        .keyboardType(.decimalPad)
                }
                
                Button {
                    viewModel.addTransaction(description: expenseDescription, origin: expenseOrigin, date: expenseDate, amount: expenseAmount, isExpense: true, formattedCurrency: viewModel.formatCurrency(expenseAmount))
                    resetFields()
                } label: {
                    Text("Add Expense")
                }
            }
            .navigationTitle("Add Expense")
        }
    }
    
    func resetFields() {
        expenseDescription = ""
        expenseOrigin = ""
        expenseDate = Date()
        expenseAmountText = ""
        expenseAmount = 0.0
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
            .environmentObject(TransactionViewModel())
    }
}
