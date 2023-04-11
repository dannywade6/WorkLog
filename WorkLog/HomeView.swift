//
//  HomeView.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Tuesday 11 April")
                        .modifier(DashboardTitleTextStyle())
                    
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
                                Text("9:00 - 3:30")
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
                    .frame(width: .infinity, height: .infinity)
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
                        ProfitLossChart()
                    }
                    .padding()
                    .background(Color.white)
                    .modifier(DashboardComponentStyle())
                    
                    Text("Invoices")
                        .modifier(DashboardHeaderTextStyle())
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Unpaid Invoices")
                                .fontWeight(.semibold)
                            Text("1 Overdue")
                                .foregroundColor(.red)
                                .bold()
                            Text("£1,100.00")
                                .font(.title3)
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.white)
                        .modifier(DashboardComponentStyle())
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("See all Invoices")
                        }
                        .frame(height: 100)
                        .padding()
                        .background(Color.white)
                        .modifier(DashboardComponentStyle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .navigationTitle("Hi, Danny")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
