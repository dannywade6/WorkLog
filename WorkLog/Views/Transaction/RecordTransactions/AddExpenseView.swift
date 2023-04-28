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
    @State private var expenseAmount: Double = 0.00
    
    let numberFormatter: NumberFormatter
    
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.currencyCode = "GBP"
    }
    
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
                    TextField("Expense Amount", value: $expenseAmount, formatter: numberFormatter)
                }
                
                Button {
                    viewModel.addTransaction2(description: expenseDescription, origin: expenseOrigin, date: expenseDate, amount: expenseAmount, isExpense: true)
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
        expenseAmount = 0.00
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
            .environmentObject(TransactionViewModel())
    }
}
