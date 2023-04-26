//
//  TransactionListView.swift
//  WorkLog
//
//  Created by Danny Wade on 14/04/2023.
//

import SwiftUI

struct TransactionListView: View {
    @StateObject var viewModel = Transaction2ViewModel()
    
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
                    NavigationLink {
                        //                        AddIncomeView()
                        AddTransaction2View(viewModel: Transaction2ViewModel())
                    } label: {
                        Text("Add Income")
                            .modifier(TransactionButtonStyle(color: Color("brand.blue.two")))
                    }
                    
                    // Add Income
                    NavigationLink {
                        AddTransactionView(viewModel: TransactionViewModel())
                    } label: {
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
                    
                    NavigationLink {
                        AllTransactionsListView(viewModel: TransactionViewModel())
                    } label: {
                        Text("View All")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .padding(.trailing)
                    }
                }
                
                ScrollView {
                    VStack {
                        LatestTransactionCardView(isExpense: false, transactionDescription: "Payment for Job", transactionBusiness: "Ian Smith", dayofWeek: "Wednesday", transactionAmount: "1,800.00")
                        LatestTransactionCardView(isExpense: true, transactionDescription: "Travel", transactionBusiness: "Transport For London", dayofWeek: "Wednesday", transactionAmount: "14.20")
                        LatestTransactionCardView(isExpense: true, transactionDescription: "Lunch", transactionBusiness: "Tesco", dayofWeek: "Wednesday", transactionAmount: "6.20")
                    }
                }
                    .padding(.horizontal)
                    .navigationTitle("Transactions")
            }
            .scrollIndicators(.hidden)
        }
        
    }
//}
}


struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
    }
}


//                    if viewModel.transaction2.isEmpty {
//                        Text("Empty Array")
//                    } else {
//                        Text("Existing Items")
//                    }
//                    List {
//                        ForEach(viewModel.transaction2) { transaction2 in
//                            Text(transaction2.description)
//                            Text(transaction2.origin)
//                        }
//                    }




//                        List(viewModel.transactions) { transaction in
//                            VStack(alignment: .leading) {
//                                Text(transaction.description)
//                                Text(transaction.origin)
//                                Text(transaction.date, style: .date)
//                                Text("$\(transaction.amount)")
////                                Text(transaction.type == .income ? "Income" : "Expense")
//                            }
//                        }
