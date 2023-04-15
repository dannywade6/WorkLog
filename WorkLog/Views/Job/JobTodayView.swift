//
//  JobTodayView.swift
//  WorkLog
//
//  Created by Danny Wade on 15/04/2023.
//

import SwiftUI

struct JobTodayView: View {
    
    let description: String
    let location: String
    let customerName: String
    let jobTime: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color("brand.blue.one"))
                    Text(description)
                }
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(Color("brand.blue.one"))
                    Text(jobTime)
                }
            }
            
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 20) {
                HStack {
                    Text(location)
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color("brand.blue.two"))
                }
                HStack {
                    Text(customerName)
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color("brand.blue.two"))
                }
            }
        }
        .fontWeight(.light)
        .padding()
        .background(Color.white)
        .modifier(DashboardComponentStyle())
    }
}

struct JobTodayView_Previews: PreviewProvider {
    static var previews: some View {
        JobTodayView(description: "Radiator Repair", location: "Wickford", customerName: "James Smith", jobTime: "12:00 - 13:00")
    }
}
