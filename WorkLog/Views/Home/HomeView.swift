//
//  HomeView.swift
//  WorkLog
//
//  Created by Danny Wade on 11/04/2023.
//

import SwiftUI
import SwipeActions

struct HomeView: View {
    
    @State var showProfileInfoView:Bool = false
    let date: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hi, Danny!")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding(.top)
                        
                        Text("\(date, style: .date)")
                            .modifier(DashboardTitleTextStyle())
                    }
                    
                    
                    Spacer()
                    
                    Button {
                        showProfileInfoView.toggle()
                    } label: {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color("brand.blue.two"))
                            .font(.largeTitle)
                            .fontWeight(.medium)
                    }
                    .fullScreenCover(isPresented: $showProfileInfoView) {
                        ProfileInfoView()
                    }
 
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Jobs Today:")
                            .modifier(DashboardHeaderTextStyle())
                        

//                            JobTodayView(description: "Change Light", location: "Hornchurch", customerName: "Mike Jones", jobTime: "10:00 - 12:00")
                            TodayJobSandboxView(viewModel: JobViewModel())
                        

                        
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
