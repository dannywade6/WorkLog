//
//  HomeView.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    let date: Date = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Hi, Danny!")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .padding(.top)
                            
                            Text("\(date, style: .date)")
                                .modifier(DashboardTitleTextStyle())

                        }
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color("brand.blue.two"))
                            .font(.largeTitle)
                            .fontWeight(.medium)
  
                    }
                    
                    Text("Jobs Today:")
                        .modifier(DashboardHeaderTextStyle())
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                                Text("Change Light Switch")
                            }
                            HStack {
                                Image(systemName: "clock.fill")
                                    .foregroundColor(Color(red: 30/255, green: 139/255, blue: 195/255))
                                Text("10:00 - 12:30")
                            }
                        }
                        
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 20) {
                            HStack {
                                Text("Upminster")
                                Image(systemName: "mappin.circle.fill")
                                    .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                            }
                            HStack {
                                Text("Joe Bloggs")
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(Color(red: 4/255, green: 59/255, blue: 92/255))
                            }
                        }
                    }
                    .fontWeight(.light)
                    .padding()
                    .background(Color.white)
                    .modifier(DashboardComponentStyle())
                    
                    
                    Text("Monthly Profit & Loss:")
                        .modifier(DashboardHeaderTextStyle())
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("£32,898.80")
                                .font(.title2)
                                .fontWeight(.regular)
                        }
                        VStack {
                            ProfitLossChart()
                                .frame(height: 130)
                        }
                    }
                    .padding(.vertical)
                    .background(Color.white)
                    .modifier(DashboardComponentStyle())
                    
                    Text("Invoices:")
                        .modifier(DashboardHeaderTextStyle())
                    
                    VStack {
                        HStack {
                            VStack(alignment: .leading){
                                Text("Unpaid Invoices")
                                    .fontWeight(.semibold)
                                Text("1 Overdue")
                                    .foregroundColor(.red)
                                    .bold()
                                Text("£1,000,000")
                            }
                            Spacer()
                            VStack {
                                HStack {
                                    Image(systemName: "exclamationmark.circle.fill")
                                        .foregroundColor(Color("brand.blue.one"))
                                    Text("5 Pending")
                                        .font(.title3)
                                        .fontWeight(.light)
                                        .foregroundColor(Color("brand.blue.two"))
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .modifier(DashboardComponentStyle())
                    
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
