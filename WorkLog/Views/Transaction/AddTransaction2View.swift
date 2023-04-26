//
//  AddTransaction2View.swift
//  WorkLog
//
//  Created by Danny Wade on 25/04/2023.
//

import SwiftUI

struct AddTransaction2View: View {
    
    @ObservedObject var viewModel: Transaction2ViewModel
    
    @State private var transaction2Description = ""
    @State private var transaction2Origin = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Transaction Description", text: $transaction2Description)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                TextField("Enter Transaction Origin", text: $transaction2Origin)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button {
                    viewModel.addTransaction2(description: transaction2Description, origin: transaction2Origin)
                    transaction2Origin = ""
                    transaction2Description = ""
                } label: {
                    Text("Add Transaction")
                }
                .padding()
                .disabled(transaction2Origin.isEmpty && transaction2Description.isEmpty)

            }
        }
    }
}

struct AddTransaction2View_Previews: PreviewProvider {
    static var previews: some View {
        AddTransaction2View(viewModel: Transaction2ViewModel())
    }
}
