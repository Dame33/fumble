//
//  FilterView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI

//we're gonna create a reusable component to allow for scroll if i wanna expand this in the future
struct FilterView: View {
    var options: [String] = ["All Players", "Trending"] /// store the header names here, so i'll do All players, and trending, maybe add a list to show trending players in the future, or what other users chose. we can do more than 2 options
    
    @AppStorage("selecte") var selection: String = "All Players"  //we'll use @AppStorage here to retain user selected position instead of @Binding
    
    var body: some View {
        HStack (alignment: .top, spacing: 26){ // add alignment on Hstack here so when u change selections there isnt that annoying little bounce
            ForEach(options, id: \.self) { option in
                VStack{
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1)
                    }
                }
                .padding(.top, 8)
                .padding(.trailing, 9)
                .padding(.leading, 9)
                .background(Color.black.opacity(0.001))
                .foregroundStyle(selection == option ? .nflBlack : .nflGray)
                // if statement, if selected it'll be black, else it'll be gray. might just make it white so it doesnt show at all idk yet
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.bouncy, value: selection)
    }
}


#Preview {
    FilterView()
        .padding()
}
