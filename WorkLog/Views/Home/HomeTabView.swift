//
//  HomeTabView.swift
//  WorkLog
//
//  Created by Danny Wade on 13/04/2023.
//

import SwiftUI

struct HomeTabView: View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
//                .onTapGesture {
//                    selectedTab = "Two"
//                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag("One")
            
            
//            AddJobView(viewModel: JobViewModel())
            JobView()
//                .onTapGesture {
//                    selectedTab = "One"
//                }
                .tabItem {
                    Label("Jobs", systemImage: "building.2.fill")
                }
                .tag("Two")
            
            TransactionListView(viewModel: TransactionViewModel())
//            TransactionsSandboxView()
                .tabItem {
                    Label("Transactions", systemImage: "dollarsign.circle")
                }
                .tag("Three")
        }
        .accentColor(Color("brand.blue.one"))
//        .padding(.top)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
