//
//  AddTransaction2View.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import SwiftUI

struct AddIncomeView: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    
    @State var incomeDescription = ""
    @State var incomeOrigin = ""
    @State var incomeDate = Date()
    @State var incomeAmount: Double = 0.00
    
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
                    TextField("Income Amount", value: $incomeAmount, formatter: numberFormatter)
                }
                
                Button {
                    viewModel.addTransaction2(description: incomeDescription, origin: incomeOrigin, date: incomeDate, amount: incomeAmount, isExpense: false)
                    resetFields()
                } label: {
                    Text("Add Income")
                }

            }
            .navigationTitle("Add Income")
        }
    }
    func resetFields() {
        incomeDescription = ""
        incomeOrigin = ""
        incomeDate = Date()
        incomeAmount = 0.00
    }
}

struct AddTransaction2View_Previews: PreviewProvider {
    static var previews: some View {
        AddIncomeView()
            .environmentObject(TransactionViewModel())
    }
}
