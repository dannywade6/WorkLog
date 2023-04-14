//
//  AddTransactionView.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var viewModel: TransactionViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var amount = ""
    @State private var isExpense = true
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount")) {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Type")) {
                    Toggle("Expense", isOn: $isExpense)
                }
                Section {
                    Button("Save") {
                        guard let amount = Double(amount) else { return }
                        viewModel.addTransaction(amount: isExpense ? -amount : amount, isExpense: isExpense)
                        resetInputFields()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add Transaction")
        }
    }
    
    func resetInputFields() {
        amount = ""
        isExpense = true
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView(viewModel: TransactionViewModel())
    }
}
