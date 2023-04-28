//
//  LatestTransactionCardView.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI

struct LatestTransactionCardView: View {
    
    var transactionDescription: String
    var transactionOrigin: String
    var transactionAmount: Double
    var transactionDate: Date
    
//    enum TransactionType {
//        case income
//        case expense
//    }
//
//    var selectedTransaction: TransactionType
    
    var isExpense: Bool
    
    var body: some View {
        VStack {
            HStack {
                HStack {
//                    Image(systemName: selectedTransaction == .expense ? "arrow.down.square.fill" : "arrow.up.square.fill")
                    Image(systemName: isExpense ? "arrow.down.square.fill" : "arrow.up.square.fill")
                        .foregroundColor(isExpense ? .red : .green)
                        .foregroundColor(.red)
                        .font(.largeTitle)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(transactionDescription)
                                .font(.headline)
                                .bold()
                            Text(transactionOrigin)
                                .font(.callout)
                                .foregroundColor(.gray)
                            Text("\(transactionDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.callout)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
//                        Text(selectedTransaction == .expense ? "- £\(transactionAmount)" : "+ £\(transactionAmount)")
                        Text(isExpense ? "- £\(transactionAmount)" : "+ £\(transactionAmount)")
                            .font(.headline)
                            .bold()
                        
                    }
                }
            }
            Divider()
        }
    }
}

struct LatestTransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
        LatestTransactionCardView(transactionDescription: "Lunch", transactionOrigin: "Tesco", transactionAmount: 12.22, transactionDate: Date(), isExpense: false)
    }
}
