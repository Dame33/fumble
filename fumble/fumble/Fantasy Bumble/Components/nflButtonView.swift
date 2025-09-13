//
//  nflButtonView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI

struct nflButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(.nflWhite)
                .frame(width: 40, height: 40)
            
            Image(systemName: "flame.fill")
                .foregroundColor(.nflFlame)
                .font(.system(size:22))
        }
    }
}

#Preview {
    nflButtonView()
}
