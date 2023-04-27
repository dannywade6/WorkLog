//
//  AddIncomeView.swift
//  WorkLog
//
//  Created by Danny Wade on 24/04/2023.
//

import SwiftUI

struct AddIncomeView: View {
    //    @EnvironmentObject var viewModel: Transaction2ViewModel
    
    var body: some View {
        VStack {
            Text("Hello")
        }
    }
}
//        NavigationStack {
//            Form {
//                Section(header: Text("Description")) {
//                    TextField("Description", text: $viewModel.transactionDescription)
//                }
//                Section(header: Text("Transaction Origin")) {
//                    TextField("Origin", text: $viewModel.transactionOrigin)
//                }
//                Section(header: Text("Transaction Date")) {
//                    DatePicker("Date", selection: $viewModel.transactionDate, displayedComponents: .date)
//                }
//                Section(header: Text("Amount")) {
//                    HStack {
//                        Text("Enter Amount")
//                        Spacer()
//
//                        // MARK: - Todo Update for Currency Keys
//                        TextField("Amount", value: $viewModel.transactionAmount, format: .currency(code: "GBP"))
//                    }
//                }
//                Button(action: {
////                    viewModel.logIncome()
//                    viewModel.saveTransaction()
//                    print(viewModel.transactions)
//                }) {
//                    Text("Save Transaction")
//                }
//            }
//            .navigationTitle("Add Transaction")
//        }
//    }
//}

struct AddIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        AddIncomeView()
    }
}
