//
//  JobListView.swift
//  WorkLog
//
//  Created by Danny Wade on 13/04/2023.
//

import SwiftUI

struct JobListView: View {
    
    @ObservedObject var viewModel: JobViewModel
    
    var body: some View {
        
        ForEach(viewModel.jobs, id: \.description) { job in
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                        Text(job.description)
                    }
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                        Text("\(job.startDateTime, style: .time) - \(job.endDateTime, style: .time)")
                    }
                }
                
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 20) {
                    HStack {
                        Text(job.location)
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                    }
                    HStack {
                        Text(job.customerName)
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                    }
                }
            }
        }
        .fontWeight(.light)
        .padding()
        .background(Color.white)
        .modifier(DashboardComponentStyle())
        
        
        
        
        
        
        
//        List(viewModel.jobs) { job in
//            VStack(alignment: .leading) {
//                Text(job.description)
//                    .font(.headline)
//                Text(job.location)
//                    .font(.subheadline)
//                Text(job.customerName)
//                    .font(.subheadline)
//                HStack {
//                    Text(job.startDateTime, style: .date)
//                    Text(job.startDateTime, style: .time)
//                }
//                HStack {
//                    Text(job.endDateTime, style: .date)
//                    Text(job.endDateTime, style: .time)
//                }
//            }
//        }
    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        JobListView(viewModel: JobViewModel())
    }
}
