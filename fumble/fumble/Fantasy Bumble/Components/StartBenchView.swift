//
//  StartBenchView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-18.
//

import SwiftUI

struct StartBenchView: View {
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                Rectangle()
                    .fill(.nflButtonBlue)
                    .frame(width: 115, height: 45)
                    .cornerRadius(32)
                
                HStack(spacing: 6){
                    Image(systemName: "xmark")
                        .foregroundColor(.nflWhite)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    //Text("Bench")
                       // .foregroundColor(.nflWhite)
                      //  .font(.title2)
                      //  .fontWeight(.bold)
                }
                .onTapGesture {
                    
                }
            }
            //.shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack{
                Rectangle()
                    .fill(.nflButtonBlue)
                    .frame(width: 115, height: 45)
                    .cornerRadius(32)
                
                HStack(spacing: 6){
                    Image(systemName: "checkmark")
                        .foregroundColor(.nflWhite)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                   // Text("Start")
                      //  .foregroundColor(.nflWhite)
                       // .font(.title2)
                      // .fontWeight(.bold)
                }
                .onTapGesture {
                    
                }
            }
           // .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
            .frame(maxWidth: .infinity, alignment: .trailing)
                        
        }.padding(.horizontal, 65)
       
            
        
    }
    
}

#Preview {
    StartBenchView()
}
