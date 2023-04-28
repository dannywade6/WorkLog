//
//  AllTransactionsListView.swift
//  WorkLog
//
//  Created by Danny Wade on 24/04/2023.
//

import SwiftUI

struct AllTransactionsListView: View {
    
    @EnvironmentObject var viewModel: Transaction2ViewModel
    
    @State var transactionOptions: [String] = ["All", "Income", "Expense"]
    @State var transactionSelection = "All"
    
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Picker("Pick an Option", selection: $transactionSelection) {
                    ForEach(transactionOptions, id: \.self) { item in
                        Text(item)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                .padding(.horizontal, 20)
            }
            
            ScrollView {
                VStack {
                    ForEach(viewModel.transaction2) { transaction in
                        LatestTransactionCardView(transactionDescription: transaction.description, transactionOrigin: transaction.origin, transactionAmount: transaction.amount, transactionDate: transaction.date, isExpense: transaction.isExpense)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Transaction History")
        }
    }
}

struct AllTransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllTransactionsListView()
            .environmentObject(Transaction2ViewModel())
    }
}
