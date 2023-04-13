//
//  ContentView.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = JobViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: AddJobView(viewModel: viewModel)) {
                    Text("Add Job")
                }
                JobListView(viewModel: viewModel)
            }
            .navigationTitle("Jobs")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
