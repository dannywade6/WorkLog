//
//  LatestTransactionCardView.swift
//  WorkLog
//
//  Created by Danny Wade on 18/04/2023.
//

import SwiftUI

struct LatestTransactionCardView: View {
    
    var isExpense: Bool
    var transactionDescription: String
    var transactionBusiness: String
    var dayofWeek: String
    var transactionAmount: String
    
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: isExpense ? "arrow.down.square.fill" : "arrow.up.square.fill")
                        .foregroundColor(isExpense ? .red : .green)
                        .font(.largeTitle)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(transactionDescription)
                                .font(.headline)
                                .bold()
                            Text(transactionBusiness)
                                .font(.callout)
                                .foregroundColor(.gray)
                            Text(dayofWeek)
                                .font(.callout)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
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
        LatestTransactionCardView(isExpense: true, transactionDescription: "Purchase Drill", transactionBusiness: "B&Q", dayofWeek: "Wednesday", transactionAmount: "299.99")
    }
}
