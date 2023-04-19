//
//  TransactionsSandboxView.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI

struct TransactionsSandboxView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                ProfitLossChart()
                
                HStack {
                    Button {
                        // Add Income
                    } label: {
                        Text("Add Income")
                            .modifier(TransactionButtonStyle(color: Color("brand.blue.one")))
                    }
                    
                    Button {
                        // Add Income
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
                    Text("View All")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.trailing)
                }
                
                ScrollView {
                    VStack {
                        LatestTransactionCardView(isExpense: false, transactionDescription: "Payment for Job", transactionBusiness: "Ian Smith", dayofWeek: "Wednesday", transactionAmount: "1,800.00")
                        
                        LatestTransactionCardView(isExpense: true, transactionDescription: "Materials", transactionBusiness: "Wickes", dayofWeek: "Tuesday", transactionAmount: "400.00")
                        
                        LatestTransactionCardView(isExpense: true, transactionDescription: "Wages", transactionBusiness: "Myself", dayofWeek: "Monday", transactionAmount: "150.00")
                        
                        LatestTransactionCardView(isExpense: false, transactionDescription: "Sale of Van", transactionBusiness: "WeBuyAnyCar", dayofWeek: "Monday", transactionAmount: "8,000.00")
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle("Transactions")
        }
    }
}

struct TransactionsSandboxView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsSandboxView()
    }
}
