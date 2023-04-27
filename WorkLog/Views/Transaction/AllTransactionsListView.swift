//
//  AllTransactionsListView.swift
//  WorkLog
//
//  Created by Danny Wade on 24/04/2023.
//

import SwiftUI

struct AllTransactionsListView: View {
    @ObservedObject var viewModel: TransactionViewModel
    
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
//                        LatestTransactionCardView(isExpense: false, transactionDescription: "Payment for Job", transactionOrigin: "Ian Smith", dayofWeek: "Wednesday", transactionAmount: "1,800.00")
//                        
//                        LatestTransactionCardView(isExpense: true, transactionDescription: "Materials", transactionOrigin: "Wickes", dayofWeek: "Tuesday", transactionAmount: "400.00")
//                        
//                        LatestTransactionCardView(isExpense: true, transactionDescription: "Wages", transactionOrigin: "Myself", dayofWeek: "Monday", transactionAmount: "150.00")
//                        
//                        LatestTransactionCardView(isExpense: false, transactionDescription: "Sale of Van", transactionOrigin: "WeBuyAnyCar", dayofWeek: "Monday", transactionAmount: "8,000.00")
                    }
                .padding(.horizontal)
            }
            .navigationTitle("Transaction History")
        }
    }
}

struct AllTransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllTransactionsListView(viewModel: TransactionViewModel())
    }
}
