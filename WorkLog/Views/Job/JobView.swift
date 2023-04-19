//
//  JobView.swift
//  WorkLog
//
//  Created by Danny Wade on 17/04/2023.
//

import SwiftUI

struct JobView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button {
                        
                    } label: {
                        Text("Create Job")
                            .modifier(TransactionButtonStyle(color: Color("brand.blue.two")))
                    }
                    Button {
                        
                    } label: {
                        Text("Completed Jobs")
                            .modifier(TransactionButtonStyle(color: Color("brand.gray.two")))
                    }

                }
                .padding()
                ScrollView {
                    JobCardView(customerName: "Adam Cooper", jobDescription: "Fix Guttering", location: "Enfield", day: "Today")
                    JobCardView(customerName: "Jay Rutland", jobDescription: "Change Carpet", location: "Grays", day: "Today")
                    JobCardView(customerName: "Alice Small", jobDescription: "Repair Light", location: "Billericay", day: "Today")
                }
                Spacer()
            }
            .navigationTitle("Jobs Dashboard")
        }
    }
    
}


struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
