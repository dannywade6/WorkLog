//
//  ProfileInfoView.swift
//  WorkLog
//
//  Created by Danny Wade on 15/04/2023.
//

import SwiftUI

struct ProfileInfoView: View {
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let year = Calendar.current.component(.year, from: Date())
    @State private var yourName: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var localCurrency: [String] = ["£ GBP", "$ USD", "€ EUR", "¥ JPY", "A$ AUD", "C$ CAD", "₣ CHF", "¥ CNH", "HK$ HKD", "$NZ NZD"]
    @State private var localCurrencySelection: String = ""
    
    var body: some View {
        // MARK: - Todo: Change to Logo
        VStack(alignment: .center, spacing: 10) {
            Text("WorkLog")
                .foregroundColor(Color("brand.blue.one"))
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Spacer()
            
            Form {
                Section("User Preferences") {
                    HStack {
                        Text("Edit Your Name:")
                            .foregroundColor(.gray)
                        Spacer()
                        
                        TextField("Your Name", text: $yourName)
                            .multilineTextAlignment(.trailing)
                        
                    }
                    HStack {
                        Picker(selection: $localCurrencySelection, label: Text("Select Local Currency:").foregroundColor(.gray)) {
                            ForEach(localCurrency, id:\.self) { currency in
                                Text(currency)
                            }
                            .pickerStyle(.automatic)
                        }
                    }
                    
                }
                
                Section(header: Text("About WorkLog")) {
                    FormRowView(firstItem: "Application", secondItem: "WorkLog")
                    FormRowView(firstItem: "Developer", secondItem: "Danny Wade")
                    FormRowView(firstItem: "Designer", secondItem: "Danny Wade")
                    FormRowView(firstItem: "Website", secondItem: "dwadeios.com")
                    FormRowView(firstItem: "Copyright", secondItem: "©️ \(year) All Rights Reserved")
                    FormRowView(firstItem: "Version", secondItem: appVersion ?? "N/A")
                }
            }
            
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .foregroundColor(Color("brand.blue.two"))
            }
                .padding(.top, 10)
                .padding(.trailing, 20)
                .accentColor(Color.secondary)
            , alignment: .topTrailing
        )
    }
}

struct FormRowView: View {
    
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text("\(firstItem):")
                .foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}


struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
