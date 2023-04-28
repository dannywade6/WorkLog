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
                HStack(alignment: .top) {
                    Text("\(date, style: .date)")
                        .modifier(DashboardTitleTextStyle())
                    Spacer()
                    
                    
                    
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Upcoming Jobs:")
                            .modifier(DashboardHeaderTextStyle())
                        TodayJobSandboxView(viewModel: JobViewModel())
                        
                        Text("Profit & Loss:")
                            .modifier(DashboardHeaderTextStyle())
                        
                        VStack {
                            VStack {
                                Text("£700.00")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            }
                            VStack {
                                ProfitLossChart()
                                    .frame(height: 250)
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
            .navigationTitle("Hi Danny,")
            .toolbar {
                Button {
                    showProfileInfoView.toggle()
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundColor(Color("brand.blue.two"))
                        .font(.largeTitle)
                }
                .fullScreenCover(isPresented: $showProfileInfoView) {
                    ProfileInfoView()
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
