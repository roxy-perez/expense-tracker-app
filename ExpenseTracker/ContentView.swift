//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Roxy Pérez  on 17/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    // MARK: Title
                Text("Overview")
                .font(.title2)
                .bold()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .background(Color.appBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                // MARK: Notification Icon
                ToolbarItem{
                    Image(systemName:"bell.badge")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.appIconColor, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
