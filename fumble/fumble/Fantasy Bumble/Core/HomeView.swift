//
//  HomeView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI

struct HomeView: View {
    
    @State private var options: [String] = ["All Players", "Trending"]
    @AppStorage("home_filter") private var selection: String = "All Players"
    
    var body: some View {
        ZStack{
            Color.nflWhite.ignoresSafeArea()
            VStack(spacing: 8){
                header // header is kept as a var, so we can use spacer method to just push it all up
                FilterView()
                Divider()
                Spacer()
                CardView()
            }
            .padding(8)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0){
            HStack(spacing:0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                    
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading) //buttom and back arrow, should be on left most of page
            
            Text("fumble.")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.nflBlue)
                .frame(maxWidth: .infinity, alignment: .center) // title should be in center
            
            Image(systemName: "star")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                
                }
                .frame(maxWidth: .infinity, alignment: .trailing) // star at right most part of screen
            
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.nflBlack)
    }
}

#Preview {
    HomeView()
}
