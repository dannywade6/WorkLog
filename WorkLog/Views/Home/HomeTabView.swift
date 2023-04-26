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
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag("One")
            JobView()
                .tabItem {
                    Label("Jobs", systemImage: "building.2.fill")
                }
                .tag("Two")
            
            TransactionListView()
                .tabItem {
                    Label("Transactions", systemImage: "dollarsign.circle")
                }
                .tag("Three")
        }
        .accentColor(Color("brand.blue.one"))
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
