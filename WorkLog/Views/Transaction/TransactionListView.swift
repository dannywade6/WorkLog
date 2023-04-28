//
//  TransactionListView.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var viewModel: TransactionViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: -5) {
                    Text("Current Profit")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.leading)
                        .padding(.bottom, 5)
                    HStack(alignment: .bottom) {
                        Text("£700.00")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Menu(content: {
                            // Menu
                        }, label: {
                            HStack {
                                Image(systemName: "calendar")
                                Text("Last 7 Days")
                            }
                            .foregroundColor(Color("brand.blue.one"))
                        })
                        .padding(.trailing)
                        
                        
                    }
                    ProfitLossChart()
                }
                
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
                                LatestTransactionCardView(transactionDescription: transaction.description, transactionOrigin: transaction.origin, transactionAmount: transaction.amount, transactionDate: transaction.date, isExpense: transaction.isExpense)
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
        TransactionListView()
            .environmentObject(TransactionViewModel())
    }
}
