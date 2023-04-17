//
//  TodayJobSandboxView.swift
//  WorkLog
//
//  Created by Danny Wade on 17/04/2023.
//

import SwiftUI
import SwipeActions

struct TodayJobSandboxView: View {
    
    @ObservedObject var viewModel: JobViewModel
    
    var body: some View {
        VStack {
            
            if viewModel.jobs.isEmpty {
                VStack {
                    Text("You have no jobs today!")
                    Button {
                        viewModel.generateMockJob()
                    } label: {
                        Text("Generate Jobs")
                    }
                }
            } else {
                ForEach(viewModel.jobs, id: \.description) { job in
                    SwipeView {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundColor(Color("brand.blue.one"))
                                    Text(job.description)
                                }
                                HStack {
                                    Image(systemName: "clock.fill")
                                        .foregroundColor(Color("brand.blue.one"))
                                    Text("12:00 - 14:00")
                                }
                            }
                            
                            
                            Spacer()
                            
                            VStack(alignment: .trailing, spacing: 20) {
                                HStack {
                                    Text(job.location)
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(Color("brand.blue.two"))
                                }
                                HStack {
                                    Text(job.customerName)
                                    Image(systemName: "person.circle.fill")
                                        .foregroundColor(Color("brand.blue.two"))
                                }
                            }
                        }
                    } trailingActions: { _ in
                        SwipeAction("Complete") {
                            print("Complete")
                        }
                    }
                }
                .fontWeight(.light)
                .padding()
                .background(Color.white)
                .modifier(DashboardComponentStyle())
                
            }
            
        }
        
        
        
        
    }
}

struct TodayJobSandboxView_Previews: PreviewProvider {
    static var previews: some View {
        TodayJobSandboxView(viewModel: JobViewModel())
    }
}
