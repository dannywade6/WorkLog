//
//  AddJobView.swift
//  WorkLog
//
//  Created by Danny Wade on 13/04/2023.
//

import SwiftUI

struct AddJobView: View {
    
    @ObservedObject var viewModel: JobViewModel
    
    @State private var description: String = ""
    @State private var location: String = ""
    @State private var customerName: String = ""
    @State private var startDateTime = Date()
    @State private var endDateTime = Date()
    
    
    var body: some View {
        Form {
            TextField("Type of Job", text: $description)
            TextField("Location of Job", text: $location)
            TextField("Customer Name", text: $customerName)
            DatePicker("Job Start Date", selection: $startDateTime)
            DatePicker("Job End Date", selection: $endDateTime)
            
            Button("Save") {
                viewModel.addJob(description: description, location: location, customerName: customerName, startDateTime: startDateTime, endDateTime: endDateTime)
            }
        }
    }
}

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        AddJobView(viewModel: JobViewModel())
    }
}
