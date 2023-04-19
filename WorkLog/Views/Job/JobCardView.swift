//
//  JobCardView.swift
//  WorkLog
//
//  Created by Danny Wade on 19/04/2023.
//

import SwiftUI

struct JobCardView: View {
    
    let date: Date = Date()
    let customerName: String
    let jobDescription: String
    let location: String
    let day: String
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Text(customerName)
                        .foregroundColor(.gray)
//                    Spacer()
//                    Text("\(date, style: .date)")
//                        .foregroundColor(.gray)
//                        .font(.callout)
                }
                
                Text(jobDescription)
                    .fontWeight(.semibold)
                    .font(.title2)
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(Color("brand.blue.one"))
                        Text(location)
                    }
                    HStack(alignment: .top, spacing: 4) {
                        Image(systemName: "calendar")
                            .foregroundColor(Color("brand.blue.two"))
//                        Text(day)
                        Text("\(date, style: .date)")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.title3)
                    }
                }
                .font(.callout)
                .padding(.bottom, 5)
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

struct JobCardView_Previews: PreviewProvider {
    static var previews: some View {
        JobCardView(customerName: "James Davison", jobDescription: "Clean Garden", location: "Dagenham", day: "Today")
    }
}
