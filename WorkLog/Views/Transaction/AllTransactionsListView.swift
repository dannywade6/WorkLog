//
//  AllTransactionsListView.swift
//  WorkLog
//
//  Created by Danny Wade on 24/04/2023.
//

import SwiftUI

struct AllTransactionsListView: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    @State var transactionSelection = "all"
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                HStack {
                    Picker("Transaction", selection: $transactionSelection) {
                        Text("All").tag("all")
                        Text("Income").tag("income")
                        Text("Expense").tag("expense")
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
                
                ScrollView {
                    VStack {
                        ForEach(filteredTransactions(), id: \.id) { transaction in
                            LatestTransactionCardView(transactionDescription: transaction.description, transactionOrigin: transaction.origin, transactionAmount: transaction.amount, transactionDate: transaction.date, transactionAmountFormatted: transaction.formattedCurrency ?? "N/A", isExpense: transaction.isExpense)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("All Transactions")
        }
    }
    
    func filteredTransactions() -> [Transaction] {
        switch transactionSelection {
        case "income":
            return viewModel.transaction.filter { !$0.isExpense }
        case "expense":
            return viewModel.transaction.filter { $0.isExpense }
        default:
            return viewModel.transaction
        }
    }
}

struct AllTransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllTransactionsListView()
            .environmentObject(TransactionViewModel())
    }
}
