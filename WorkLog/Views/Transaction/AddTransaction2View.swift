//
//  AddTransaction2View.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import SwiftUI

struct AddTransaction2View: View {
    
    @EnvironmentObject var viewModel: Transaction2ViewModel
    
    
    @State var income2Description = ""
    @State var income2Origin = ""
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
                    TextField("Description", text: $income2Description)
                }
                Section(header: Text("Income Origin")) {
                    TextField("Source of Income", text: $income2Origin)
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
                    viewModel.addTransaction2(description: income2Description, origin: income2Origin, date: incomeDate, amount: incomeAmount, transactionType: .income)
                } label: {
                    Text("Add Income")
                }

            }
            .navigationTitle("Add Income")
        }
    }
}

struct AddTransaction2View_Previews: PreviewProvider {
    static var previews: some View {
        AddTransaction2View()
    }
}
