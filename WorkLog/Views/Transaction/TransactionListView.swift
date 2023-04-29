//
//  TransactionListView.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

struct TransactionListView: View {
    
//    @EnvironmentObject var viewModel: TransactionViewModel
    @StateObject var viewModel: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfitLossChart(viewModel: viewModel)
                
                HStack {
                    // Add Income
                    NavigationLink(destination:AddIncomeView().environmentObject(viewModel)) {
                        Text("Add Income")
                            .modifier(TransactionButtonStyle(color: Color("brand.blue.two")))
                    }
                    
                    // Add Expense
                    NavigationLink(destination:AddExpenseView().environmentObject(viewModel)) {
                        Text("Add Expense")
                            .foregroundColor(.black)
                            .modifier(TransactionButtonStyle(color: Color("brand.gray.two")))
                    }
                }
                .padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("Latest Transactions")
                        .modifier(DashboardTitleTextStyle())
                        .padding(.leading)
                    Spacer()
                    
                    if !viewModel.transaction.isEmpty {
                        NavigationLink(destination: AllTransactionsListView().environmentObject(viewModel)) {
                            Text("View All")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding(.trailing)
                        }
                    }
                }
                
                ScrollView {
                    VStack {
                        
                        
                        if viewModel.transaction .isEmpty {
                            EmptyStateView().scrollDisabled(true)
                        } else {
                            ForEach(viewModel.transaction) { transaction in
                                LatestTransactionCardView(transactionDescription: transaction.description, transactionOrigin: transaction.origin, transactionAmount: transaction.amount, transactionDate: transaction.date, transactionAmountFormatted: transaction.formattedCurrency ?? "N/A", isExpense: transaction.isExpense)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Transactions")
            }
            .scrollIndicators(.hidden)
        }
    }
}


struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionViewModel())
    }
}
