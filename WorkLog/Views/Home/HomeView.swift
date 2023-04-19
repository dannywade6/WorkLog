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
                        Text("Upcoming Jobs:")
                            .modifier(DashboardHeaderTextStyle())
                        

//                            JobTodayView(description: "Change Light", location: "Hornchurch", customerName: "Mike Jones", jobTime: "10:00 - 12:00")
//                            TodayJobSandboxView(viewModel: JobViewModel())
                        
                        JobEmptyStateView()
                            .padding(.bottom)
                        

                        
                        Text("Profit & Loss:")
                            .modifier(DashboardHeaderTextStyle())
                        
                        VStack {
                            VStack {
                                Text("£32,898.80")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                ProfitLossChart()
                            }
                        }
                        .padding(.vertical)
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
