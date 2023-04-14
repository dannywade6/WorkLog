//
//  TransactionListView.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

struct TransactionListView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.transactions, id: \.date) { transaction in
                
                HStack {
                    Text(transaction.date, style: .date)
                    Spacer()
                    Text(String(format: "£%.2f", transaction.amount))
                        .foregroundColor(transaction.isExpense ? .red : .green)
                }
            }
            .navigationTitle("Transactions")
            .navigationBarItems(trailing: Text(String(format: "£%.2f", viewModel.total)))
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionViewModel())
    }
}
